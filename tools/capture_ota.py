"""mitmproxy addon: save Nothing firmware metadata traffic locally, redact URL queries in console."""
from mitmproxy import http
from pathlib import Path
import json,time,urllib.parse
OUT=Path('artifacts/network');OUT.mkdir(parents=True,exist_ok=True)
def response(flow:http.HTTPFlow):
    if 'nothing' not in flow.request.pretty_host or not any(k in flow.request.path.lower() for k in ('firmware','ota','version')):return
    request=flow.request
    record={'time':time.time(),'method':request.method,'host':request.pretty_host,'path':request.path,'status':flow.response.status_code,'response':flow.response.get_text(strict=False)}
    target=OUT/f'{time.time_ns()}.json';target.write_text(json.dumps(record,indent=2))
    print('OTA',request.method,request.pretty_host,urllib.parse.urlsplit(request.path).path,flow.response.status_code,flush=True)
