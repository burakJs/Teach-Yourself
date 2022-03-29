// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      uid: json['uid'] as String?,
      questionText: json['questionText'] as String,
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
      correctAnswer: json['correctAnswer'] as int,
      image: json['image'] as String?,
      createdTime:
          Question._fromJson(json['createdTime'] as Map<String, dynamic>),
      solvedTime:
          Question._fromJson(json['solvedTime'] as Map<String, dynamic>),
      isConfirmed: json['isConfirmed'] as bool? ?? false,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'uid': instance.uid,
      'questionText': instance.questionText,
      'answers': instance.answers,
      'correctAnswer': instance.correctAnswer,
      'image': instance.image,
      'createdTime': Question._toJson(instance.createdTime),
      'solvedTime': Question._toJson(instance.solvedTime),
      'isConfirmed': instance.isConfirmed,
    };
