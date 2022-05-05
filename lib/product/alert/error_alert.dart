import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../extensions/string_extension.dart';

import '../constant/color_constants.dart';

class ErrorAlert extends StatelessWidget {
  ErrorAlert({Key? key, required this.content}) : super(key: key);
  final String content;
  final ColorConstants _colors = ColorConstants.instance;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Error',
        style: context.textTheme.headline4?.copyWith(
          color: _colors.redColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        content.fireErrorLocal,
        style: context.textTheme.headline6?.copyWith(),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(
            'Ok',
            style: context.textTheme.headline6?.copyWith(
              color: _colors.blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
