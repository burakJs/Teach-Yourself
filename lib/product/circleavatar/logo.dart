import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../constant/string_constant.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, required this.radius}) : super(key: key);
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: context.colorScheme.onSurface,
      child: Text(
        StringConstant.logoText,
        style: context.textTheme.headline3?.copyWith(
          color: context.colorScheme.onBackground,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
