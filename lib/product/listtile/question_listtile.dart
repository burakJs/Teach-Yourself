import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/product/model/question.dart';

class QuestionListTile extends StatelessWidget {
  const QuestionListTile({Key? key, required this.question}) : super(key: key);
  final Question question;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        question.questionText,
        style: context.textTheme.headline6,
      ),
      subtitle: Text(
        question.answers.join(' - '),
        style: context.textTheme.bodyLarge,
      ),
      trailing: Text(
        DateFormat('dd-MM-yyyy - kk:mm').format(question.time.toDate()),
      ),
    );
  }
}
