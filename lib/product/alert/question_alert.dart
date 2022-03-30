import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../constant/color_constants.dart';

import '../model/question.dart';

class QuestionAlert extends StatelessWidget {
  QuestionAlert({Key? key, required this.question}) : super(key: key);
  final Question question;
  final ColorConstants _colors = ColorConstants.instance;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(question.questionText),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // question.image != null ? Image.network(question.image!) : const SizedBox(),
          SizedBox(
            height: context.height / 4,
            child: Image.network('https://i.picsum.photos/id/130/536/354.jpg?hmac=a3CMMZgFMD60VsyMXoXbMllYckSrfgS3Dr5pUzkoZqs',
                fit: BoxFit.cover),
          ),
          context.emptySizedHeightBoxNormal,
          for (String answer in question.answers)
            Text(
              answer,
              style: context.textTheme.headline6?.copyWith(
                color: answer == question.answers[question.correctAnswer] ? _colors.greenColor : _colors.blackColor,
              ),
            ),
        ],
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
        question.isConfirmed
            ? const SizedBox()
            : TextButton(
                onPressed: () {},
                child: Text(
                  'Confirmed',
                  style: context.textTheme.headline6?.copyWith(
                    color: _colors.greenColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      ],
    );
  }
}
