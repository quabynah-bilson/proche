import 'dart:convert';

import 'package:flutter/services.dart';

Future<String> assetToBase64(String assetPath) async {
  // Load asset file as bytes
  ByteData assetByteData = await rootBundle.load(assetPath);
  Uint8List assetBytes = assetByteData.buffer.asUint8List();

  // Convert bytes to base64
  return base64Encode(assetBytes);
}

Future<Uint8List> assetToBytes(String assetPath) async {
  // Load asset file as bytes
  ByteData assetByteData = await rootBundle.load(assetPath);
  return assetByteData.buffer.asUint8List();
}
