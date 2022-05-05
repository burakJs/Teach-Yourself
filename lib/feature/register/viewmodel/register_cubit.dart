import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/init/data/concrete/firebase_manager.dart';
import '../../../core/init/navigation/navigation_manager.dart';
import '../../../product/constant/navigation_constants.dart';
import 'register_state.dart';
import '../../../product/data/auth/abstract/auth_service.dart';
import '../../../product/data/auth/concrete/auth_manager.dart';
import '../../../product/enums/person_type_enum.dart';
import '../../../product/model/person.dart';

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
        navigatePage(person);
      } else {
        emit(RegisterError(error: message));
      }
    } else {
      emit(RegisterError(error: 'Check all credentials'));
    }
  }

  void navigatePage(Person? person) {
    emit(RegisterSuccess(person: person));

    switch (person?.type) {
      case PersonType.admin:
        NavigationManager.instance.navigateToPageClear(NavigationConstants.ADMIN_HOME, data: person);
        break;
      case PersonType.questioner:
        NavigationManager.instance.navigateToPageClear(NavigationConstants.QUESTIONER_HOME, data: person);
        break;
      case PersonType.student:
        NavigationManager.instance.navigateToPageClear(NavigationConstants.STUDENT_HOME, data: person);
        break;
      default:
    }

    emit(RegisterInitial());
    clearTextfield();
  }

  void clearTextfield() {
    nameController.text = '';
    surnameController.text = '';
    usernameController.text = '';
    emailController.text = '';
    passwordController.text = '';
  }
}
