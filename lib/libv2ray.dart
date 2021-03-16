import 'dart:async';

import 'package:flutter/services.dart';
import 'message.dart';

class Libv2ray {
  static const MethodChannel _channel = const MethodChannel('libv2ray');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> start(String config) async {
    StartRequest params = StartRequest()..config = config;
    V2rayApi api = V2rayApi();
    await api.start(params);
    return;
  }

  static Future<void> stop() async {
    V2rayApi api = V2rayApi();
    await api.stop();
  }
}
