// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      questionText: json['questionText'] as String,
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
      correctAnswer: json['correctAnswer'] as int,
      image: json['image'] as String?,
      createdTime: Question._timeFromJson(json['createdTime'] as Timestamp?),
      solvedTime: Question._timeFromJson(json['solvedTime'] as Timestamp?),
      askableDate: Question._timeFromJson(json['askableDate'] as Timestamp?),
      level: Question._levelFromJson(json['level'] as String),
      isConfirmed: json['isConfirmed'] as bool? ?? false,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'questionText': instance.questionText,
      'answers': instance.answers,
      'correctAnswer': instance.correctAnswer,
      'image': instance.image,
      'createdTime': Question._timeToJson(instance.createdTime),
      'solvedTime': Question._timeToJson(instance.solvedTime),
      'askableDate': Question._timeToJson(instance.askableDate),
      'level': Question._levelToJson(instance.level),
      'isConfirmed': instance.isConfirmed,
    };
