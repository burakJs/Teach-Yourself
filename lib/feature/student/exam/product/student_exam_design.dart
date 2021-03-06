import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:teach_yourself/product/model/question.dart';

class StudentExamDesign extends StatefulWidget {
  const StudentExamDesign({Key? key, required this.question, required this.optionSelected}) : super(key: key);
  final Question question;
  final Function(int option) optionSelected;
  @override
  State<StudentExamDesign> createState() => _StudentExamDesignState();
}

class _StudentExamDesignState extends State<StudentExamDesign> {
  int selectedOption = -1;

  void setOption(int index) {
    setState(() {
      selectedOption = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.question.image == null ? const SizedBox() : _questionImage(),
          Text(
            widget.question.questionText,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          for (int i = 0; i < widget.question.answers.length; i++) _optionBody(i, context)
        ],
      ),
    );
  }

  Widget _optionBody(int i, BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.optionSelected(i);
        setOption(i);
      },
      child: Text(
        '${String.fromCharCode(65 + i)}) ${widget.question.answers[i]}',
        style: context.textTheme.headline6?.copyWith(
          fontWeight: selectedOption == i ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Image _questionImage() {
    return Image.network(
      widget.question.image ?? '',
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        }
      },
    );
  }
}
