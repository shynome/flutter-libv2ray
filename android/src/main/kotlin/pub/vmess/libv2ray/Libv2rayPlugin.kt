package pub.vmess.libv2ray

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import pub.vmess.libv2ray.Message.*
import libv2ray.Libv2ray

/** Libv2rayPlugin */
class Libv2rayPlugin: FlutterPlugin, MethodCallHandler, V2rayApi {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "libv2ray")
    channel.setMethodCallHandler(this)
    V2rayApi.setup(flutterPluginBinding.binaryMessenger,this);
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun start(arg: StartRequest?) {
    Libv2ray.start(arg?.config)
  }

  override fun stop() {
    Libv2ray.stop()
  }

  override fun status(): StatusReply {
    var reply = StatusReply()
    reply.status = Libv2ray.status()
    return reply
  }

}
