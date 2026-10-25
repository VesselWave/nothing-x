Java.perform(function () {
  const app=Java.use('android.app.ActivityThread').currentApplication();
  if(app.getPackageName().toString()!=='com.nothing.smartcenter')throw new Error('Wrong target');
  send('Attached to original Nothing X in emulator');
  try {
    const Call=Java.use('okhttp3.internal.connection.RealCall');
    ['execute','enqueue'].forEach(function(name){
      Call[name].overloads.forEach(function(method){method.implementation=function(){
        const req=this.request();const url=req.url().toString();
        if(/nothing.*(firmware|version|ota)/i.test(url))send({request:url,method:req.method().toString()});
        return method.apply(this,arguments);
      };});
    });
    send('OkHttp tracing enabled');
  } catch(e){send('OkHttp hook: '+e);}
  setTimeout(function(){Java.perform(function(){
    try {
      const Manager=Java.use('com.nothing.device.IOTDeviceManager');
      const product=Manager.INSTANCE.value.getProductByModelId('2F45F5');
      send({mappedProduct:product?product.getProductId().toString():null});
      const Callback=Java.registerClass({
        name:'dev.nothingx.instrumentation.FirmwareContinuation',
        implements:[Java.use('kotlin.coroutines.Continuation')],
        methods:{
          getContext:function(){return Java.use('kotlin.coroutines.EmptyCoroutineContext').INSTANCE.value;},
          resumeWith:function(result){send({firmwareResult:result?result.toString():null});}
        }
      });
      Java.use('java.lang.Class').forName('com.nothing.earbase.core.api.EarDeviceRepo',true,app.getClassLoader());
      const Net=Java.use('com.nothing.network.core.NetWorkConstant');
      Net.INSTANCE.value.releaseMode();
      Net.INSTANCE.value.getURL_MAP().put('HOST_OTA',__OTA_HOST__);
      Java.use('com.nothing.network.core.HttpCer').INSTANCE.value.getCerList().add(__TEST_CA_PEM__);
      const Repo=Java.use('com.nothing.earbase.core.api.EarDeviceRepo');
      Repo.INSTANCE.value.setLastApiService(null);
      const result=Repo.INSTANCE.value.checkDeviceServer(__FIRMWARE_VERSION__,0,Java.use('java.util.HashMap').$new(),'02:00:00:00:00:01','2F45F5',Callback.$new());
      if(result && result.toString().startsWith('Error')){try{const err=Java.cast(result,Java.use('com.nothing.network.core.ApiResult$Error'));send({exceptionStack:Java.use('android.util.Log').getStackTraceString(err.getException())});}catch(e){send(String(e));}}
      send({requestStarted:result?result.toString():null,spoofedVersion:__FIRMWARE_VERSION__,model:'B187'});
    }catch(e){send({error:String(e),stack:e.stack});}
  });},4000);
});
