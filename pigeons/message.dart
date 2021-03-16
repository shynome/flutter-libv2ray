import 'package:pigeon/pigeon.dart';

class StartRequest {
  String config;
}

@HostApi()
abstract class V2rayApi {
  void start(StartRequest params);
  void stop();
}

// 输出配置
void configurePigeon(PigeonOptions opts) {
  opts.dartOut = './lib/message.dart';
  opts.javaOut = 'android/src/main/kotlin/pub/vmess/libv2ray/Message.java';
  opts.javaOptions.package = 'pub.vmess.libv2ray';
}
