import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:libv2ray/libv2ray.dart';

void main() {
  const MethodChannel channel = MethodChannel('libv2ray');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Libv2ray.platformVersion, '42');
  });
}
