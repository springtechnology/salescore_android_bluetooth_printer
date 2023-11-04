import 'dart:async';

import 'package:flutter/services.dart';

class AndroidBluetoothPrinter {
  static const MethodChannel _channel =
      const MethodChannel('android_bluetooth_printer');

  /// Print to the first connected bluetooth printer
  static Future<String?> print({
    String? text,
    int? width,
    String? ipAddress,
    String? base64Image,
  }) async {
    final String? version = await _channel.invokeMethod('print', {
      if (text != null) "text": text,
      if (ipAddress != null) "ip_address": ipAddress,
      if (width != null) "width": width,
      if (base64Image != null) "image_base64": base64Image,
    });
    return version;
  }
}
