import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import '../alert/question_alert.dart';
import '../constant/color_constants.dart';
import '../model/question.dart';

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
        DateFormat('dd-MM-yyyy - kk:mm').format(question.createdTime!.toDate()),
        style: context.textTheme.bodyLarge,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => QuestionAlert(question: question),
        );
      },
    );
  }
}
