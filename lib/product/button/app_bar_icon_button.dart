import 'package:flutter/material.dart';
import 'package:teach_yourself/product/constant/color_constants.dart';

class AppBarIconButton extends StatelessWidget {
  AppBarIconButton({required this.icon, Key? key}) : super(key: key);
  final ColorConstants _colors = ColorConstants.instance;
  final double _iconSize = 30;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: _colors.blackColor,
      size: _iconSize,
    );
  }
}
