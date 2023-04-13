import 'dart:convert';

import 'package:flutter/services.dart';

Future<String> assetToBase64(String assetPath) async {
  // Load asset file as bytes
  ByteData assetByteData = await rootBundle.load(assetPath);
  List<int> assetBytes = assetByteData.buffer.asUint8List();

  // Convert bytes to base64
  String base64Image = base64Encode(assetBytes);

  return base64Image;
}
