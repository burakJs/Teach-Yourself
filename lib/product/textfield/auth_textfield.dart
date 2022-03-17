import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.headline5,
              ),
            ],
          ),
          context.emptySizedHeightBoxLow,
          TextField(
            decoration: InputDecoration(
              contentPadding: context.paddingLow,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: context.colorScheme.onSurface,
                ),
                borderRadius: context.lowBorderRadius,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: context.colorScheme.onSurface.withOpacity(0.7),
                ),
                borderRadius: context.lowBorderRadius,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 4,
                  color: context.colorScheme.onSurface.withOpacity(0.7),
                ),
                borderRadius: context.lowBorderRadius,
              ),
            ),
            style: context.textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
