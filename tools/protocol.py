"""Nothing/CMF RFCOMM frames, based on APK 3.10.1 and B187 live captures."""
from dataclasses import dataclass
import struct

SYNC=0x55
UUID='aeac4a03-dff5-498f-843a-34487cf133eb'
COMMANDS={0xc001:'protocol',0xc007:'battery',0xc00a:'ear_status',0xc00e:'features',0xc018:'gestures',0xc01c:'model',0xc03d:'supported_notifications',0xc03e:'registered_notifications',0xc042:'firmware',0xc057:'system_audio',0xf003:'set_gestures',0xf004:'set_features',0xe014:'magic_button'}
OPERATIONS={1:'none',2:'play_pause',3:'call_or_hang_up',4:'reject_call',6:'volume_up',7:'volume_down',8:'previous',9:'next',10:'anc_control',11:'voice_assistant',12:'google_assistant',14:'alexa',17:'game_mode',18:'continuous_volume_up',19:'continuous_volume_down',20:'anc_off',21:'transparency_off',22:'anc_transparency',23:'rotate_volume',24:'pair_mode',25:'mic_mute',26:'answer_decline',27:'spatial_audio',28:'bass_enhancement',31:'news_widget_host_event',32:'nothing_radio',33:'essential_space',34:'eq_preset',39:'switch_bluetooth',40:'case_lock'}

def crc16(data:bytes)->int:
    crc=0xffff
    for byte in data:
        crc^=byte
        for _ in range(8):crc=(crc>>1)^0xa001 if crc&1 else crc>>1
    return crc

def frame(command:int,payload:bytes=b'',sequence:int=1)->bytes:
    if not 0<=command<=65535 or not 1<=sequence<=255 or len(payload)>65535:raise ValueError('Invalid frame fields')
    data=struct.pack('<BHHHB',SYNC,0x160,command,len(payload),sequence)+payload
    return data+struct.pack('<H',crc16(data))

@dataclass(frozen=True)
class Frame:
    command:int
    sequence:int
    payload:bytes
    crc_scope:str
    control:int

def decode(data:bytes)->Frame:
    if len(data)<8 or data[0]!=SYNC:raise ValueError('Invalid header')
    _,control,command,length,sequence=struct.unpack('<BHHHB',data[:8])
    has_crc=bool(control&0x20)
    if len(data)!=8+length+(2 if has_crc else 0):raise ValueError('Frame length mismatch')
    payload=data[8:8+length];scope='none'
    if has_crc:
        expected=struct.unpack('<H',data[-2:])[0]
        if crc16(data[:-2])==expected:scope='frame'
        elif crc16(payload)==expected:scope='payload'
        else:raise ValueError('CRC mismatch')
    return Frame(command,sequence,payload,scope,control)

def gestures(payload:bytes)->list:
    if not payload or len(payload)!=1+4*payload[0]:raise ValueError('Malformed gesture list')
    return [dict(device=p[0],button=p[1],gesture=p[2],operation=p[3],action=OPERATIONS.get(p[3],f'unknown_{p[3]}')) for p in [payload[i:i+4] for i in range(1,len(payload),4)]]

def features(payload:bytes)->dict:
    if not payload or len(payload)!=1+2*payload[0]:raise ValueError('Malformed feature list')
    return {payload[i]:payload[i+1] for i in range(1,len(payload),2)}
