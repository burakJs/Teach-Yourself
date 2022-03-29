import 'package:json_annotation/json_annotation.dart';
import 'package:teach_yourself/product/enums/person_type_enum.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  final String name;
  final String surname;
  final String username;
  final String email;
  final String password;
  @JsonKey()
  final PersonType type;
  Person({
    required this.name,
    required this.surname,
    required this.username,
    required this.email,
    required this.password,
    required this.type,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);

  static PersonType? _fromJson(Map<String, dynamic> json) => PersonType.values.firstWhere((e) => e.name == json['type'] as String);
  static Map<String, dynamic> _toJson(PersonType type) => {'time': type.name};
}
