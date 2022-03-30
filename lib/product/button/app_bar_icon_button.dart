import 'package:flutter/material.dart';
import '../constant/color_constants.dart';

class AppBarIconButton extends StatelessWidget {
  AppBarIconButton({required this.icon, Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;
  final ColorConstants _colors = ColorConstants.instance;
  final double _iconSize = 30;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        icon,
        color: _colors.blackColor,
        size: _iconSize,
      ),
    );
  }
}
