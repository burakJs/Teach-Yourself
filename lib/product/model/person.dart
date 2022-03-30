import 'package:json_annotation/json_annotation.dart';
import 'package:teach_yourself/product/enums/person_type_enum.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  final String name;
  final String surname;
  final String username;
  @JsonKey(ignore: true)
  final String? email;
  @JsonKey(ignore: true)
  final String? password;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final PersonType type;
  Person({
    required this.name,
    required this.surname,
    required this.username,
    this.email,
    this.password,
    required this.type,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);

  static PersonType _fromJson(String type) => PersonType.values.firstWhere(
        (e) => e.name == type,
      );
  static String _toJson(PersonType type) => type.name;
}
