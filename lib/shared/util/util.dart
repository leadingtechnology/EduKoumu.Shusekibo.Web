import 'package:flutter/material.dart';

enum DeviceType { phone, tablet, other}

DeviceType deviceType(BuildContext context) {
  
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  if (height > width) {
    if (height / width < 1.4) {
      return DeviceType.tablet;
    }
  }

  if (width > height) {
    if (width / height < 1.4) {
      return DeviceType.tablet;
    }
  }

  return DeviceType.phone;
}
