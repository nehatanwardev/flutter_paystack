import 'package:flutter/services.dart';
import 'package:paystack_flutter/src/utils/utils.dart';

abstract class BaseRequestBody {
  final fieldDevice = 'device';
  String device;

  Map<String, String> paramsMap();

  /// TODO : Support get platform id on IOS
  setDeviceId() async {
    String deviceId;
    try {
      deviceId = await Utils.channel.invokeMethod('getDeviceId');
    } on PlatformException catch (e) {
      deviceId = 'Coudn\'tGetDeviceId';
      print('An error occured while getting device Id $e');
    }
    this.device = deviceId;
  }
}
