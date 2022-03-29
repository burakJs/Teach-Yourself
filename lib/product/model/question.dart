import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  final String questionText;
  final List<String> answers;
  final int correctAnswer;
  final String? image;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final Timestamp time;

  Question({
    required this.questionText,
    required this.answers,
    required this.correctAnswer,
    this.image,
    required this.time,
  });
  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  static Timestamp _fromJson(Map<String, dynamic> json) => Timestamp.fromDate(json['time']);
  static Map<String, dynamic> _toJson(Timestamp time) => {'time': time};
}

final List<Question> questionList = [
  Question(
    questionText: 'Sizce Nedir ?',
    answers: ['1', '2', '3', '4'],
    correctAnswer: 1,
    time: Timestamp.now(),
  ),
  Question(
    questionText: 'Yaş Nedir ?',
    answers: ['1A', '2B', '3C', '4D'],
    correctAnswer: 0,
    time: Timestamp.now(),
  ),
  Question(
    questionText: 'Ben Nedir ?',
    answers: ['A1', 'A2', 'A3', 'A4'],
    correctAnswer: 2,
    time: Timestamp.now(),
  ),
];