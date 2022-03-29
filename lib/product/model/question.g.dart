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
      time: Question._fromJson(json['time'] as Map<String, dynamic>),
      isConfirmed: json['isConfirmed'] as bool? ?? false,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'uid': instance.uid,
      'questionText': instance.questionText,
      'answers': instance.answers,
      'correctAnswer': instance.correctAnswer,
      'image': instance.image,
      'time': Question._toJson(instance.time),
      'isConfirmed': instance.isConfirmed,
    };
