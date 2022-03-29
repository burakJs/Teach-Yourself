// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      name: json['name'] as String,
      surname: json['surname'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      type: $enumDecode(_$PersonTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'type': _$PersonTypeEnumMap[instance.type],
    };

const _$PersonTypeEnumMap = {
  PersonType.admin: 'admin',
  PersonType.questioner: 'questioner',
  PersonType.student: 'student',
};
