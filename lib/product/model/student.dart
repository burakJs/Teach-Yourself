import 'package:json_annotation/json_annotation.dart';
import 'package:teach_yourself/product/enums/person_type_enum.dart';

import 'package:teach_yourself/product/model/question.dart';

import 'person.dart';

part 'student.g.dart';

@JsonSerializable()
class Student extends Person {
  final List<Question> correctList;
  final List<Question> doneList;
  Student({
    required this.correctList,
    required this.doneList,
    required String name,
    required String surname,
    required String username,
    required String email,
    required String password,
  }) : super(
          name: name,
          surname: surname,
          username: username,
          email: email,
          password: password,
          type: PersonType.student,
        );

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
