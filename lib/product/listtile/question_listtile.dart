import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/product/constant/color_constants.dart';
import 'package:teach_yourself/product/model/question.dart';

class QuestionListTile extends StatelessWidget {
  QuestionListTile({Key? key, required this.question, required this.onPressed}) : super(key: key);
  final Question question;
  final VoidCallback onPressed;
  final ColorConstants _colors = ColorConstants.instance;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: question.isConfirmed ? Colors.green.withOpacity(0.3) : Colors.red.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: _colors.whiteColor, width: 1),
        borderRadius: context.lowBorderRadius,
      ),
      title: Text(
        question.questionText,
        style: context.textTheme.headline6,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        question.answers.join(' - '),
        style: context.textTheme.bodyLarge,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        DateFormat('dd-MM-yyyy - kk:mm').format(question.time.toDate()),
        style: context.textTheme.bodyLarge,
      ),
      onTap: onPressed,
    );
  }
}