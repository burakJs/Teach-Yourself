import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants? _instance;
  static ColorConstants get instance => _instance ??= ColorConstants._init();
  ColorConstants._init();

  final Color blackColor = Colors.black;
  final Color whiteColor = Colors.white;
  final Color greenColor = Colors.green;
}
