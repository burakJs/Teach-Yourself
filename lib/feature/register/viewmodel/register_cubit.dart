import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teach_yourself/core/init/data/concrete/firebase_manager.dart';
import 'package:teach_yourself/feature/register/viewmodel/register_state.dart';
import 'package:teach_yourself/product/data/auth/abstract/auth_service.dart';
import 'package:teach_yourself/product/data/auth/concrete/auth_manager.dart';
import 'package:teach_yourself/product/enums/person_type_enum.dart';
import 'package:teach_yourself/product/model/person.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({AuthService? service})
      : _service = service ?? AuthManager(service: FirebaseManager()),
        super(RegisterInitial());

  final AuthService _service;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  int dropDownIndex = 0;

  void setDropDownValue(int? index) {
    dropDownIndex = index ?? 0;
    emit(RegisterDropdownChanged(index: index ?? 0));
  }

  Future<void> register() async {
    emit(RegisterLoading());
    if (nameController.text != '' &&
        surnameController.text != '' &&
        usernameController.text != '' &&
        emailController.text != '' &&
        passwordController.text != '') {
      Person person = Person(
        name: nameController.text,
        surname: surnameController.text,
        username: usernameController.text,
        type: PersonType.values[dropDownIndex],
        password: passwordController.text,
        email: emailController.text,
      );

      String? message = await _service.registerAndSave(person);
      if (message == null) {
        emit(RegisterSuccess(person: person));
      } else {
        emit(RegisterError(error: message));
      }
    } else {
      emit(RegisterError(error: 'Check all credentials'));
    }
  }
}