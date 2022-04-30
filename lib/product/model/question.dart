import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../enums/question_level_enum.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  @JsonKey(ignore: true)
  String? uid;
  final String questionText;
  final List<String> answers;
  final int correctAnswer;
  String? image;
  @JsonKey(fromJson: _timeFromJson, toJson: _timeToJson)
  final Timestamp? createdTime;
  @JsonKey(fromJson: _timeFromJson, toJson: _timeToJson)
  final Timestamp? solvedTime;
  @JsonKey(fromJson: _timeFromJson, toJson: _timeToJson)
  final Timestamp? askableDate;
  @JsonKey(fromJson: _levelFromJson, toJson: _levelToJson)
  final QuestionLevel? level;
  bool isConfirmed;

  Question({
    this.uid,
    required this.questionText,
    required this.answers,
    required this.correctAnswer,
    this.image,
    required this.createdTime,
    this.solvedTime,
    this.askableDate,
    this.level,
    this.isConfirmed = false,
  });

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  static Timestamp? _timeFromJson(Timestamp? time) => time;
  static Timestamp? _timeToJson(Timestamp? time) => time;

  static QuestionLevel? _levelFromJson(String type) => QuestionLevel.values.firstWhere(
        (e) => e.name == type,
      );
  static String _levelToJson(QuestionLevel? type) => (type ?? QuestionLevel.oneDay).name;
}

final List<Question> questionList = [
  Question(
    questionText: 'Sizce Nedir ?',
    answers: ['1', '2', '3', '4'],
    correctAnswer: 1,
    createdTime: Timestamp.now(),
    level: QuestionLevel.oneDay,
  ),
  Question(
    questionText: 'Yaş Nedir ?',
    answers: ['1A', '2B', '3C', '4D'],
    correctAnswer: 0,
    createdTime: Timestamp.now(),
    level: QuestionLevel.oneDay,
  ),
  Question(
    questionText: 'Ben Nedir ?',
    answers: ['A1', 'A2', 'A3', 'A4'],
    correctAnswer: 2,
    createdTime: Timestamp.now(),
    level: QuestionLevel.oneDay,
  ),
];
