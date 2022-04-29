import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AppButton extends StatelessWidget {
  const AppButton({Key? key, required this.text, required this.callBack}) : super(key: key);
  final String text;
  final VoidCallback callBack;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingNormal,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: context.colorScheme.onSurface,
        ),
        onPressed: callBack,
        child: Padding(
          padding: context.paddingLow,
          child: Text(
            text,
            style: context.textTheme.headline6?.copyWith(
              color: context.colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
