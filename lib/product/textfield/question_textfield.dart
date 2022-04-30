import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/product/constant/color_constants.dart';

class QuestionTextField extends StatelessWidget {
  QuestionTextField({
    Key? key,
    required this.controller,
    required this.line,
    required this.hint,
    required this.val,
    required this.groupValue,
    required this.changeCallback,
  }) : super(key: key);

  final ColorConstants _colors = ColorConstants.instance;
  final TextEditingController controller;
  final int line;
  final String hint;
  final int val;
  final int groupValue;
  final Function(int? changedIndex) changeCallback;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: _colors.blackColor.withOpacity(0.1),
      child: Padding(
        padding: context.paddingLow,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                maxLines: line,
                decoration: InputDecoration.collapsed(hintText: hint),
                style: context.textTheme.headlineSmall?.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
            line > 2
                ? const SizedBox()
                : Radio<int>(
                    value: val,
                    activeColor: _colors.blackColor,
                    groupValue: groupValue,
                    onChanged: (val) {
                      changeCallback(val);
                    },
                  )
          ],
        ),
      ),
    );
  }
}
