import 'package:flutter/material.dart';
import 'package:teach_yourself/product/model/question.dart';

class StudentExamResultView extends StatelessWidget {
  const StudentExamResultView({Key? key, required this.rightQuestions, required this.wrongQuestions}) : super(key: key);

  final List<Question> rightQuestions;
  final List<Question> wrongQuestions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Doğru Sayısı: ${rightQuestions.length}'),
          Text('Yanlış Sayısı: ${wrongQuestions.length}'),
        ],
      ),
    );
  }
}
