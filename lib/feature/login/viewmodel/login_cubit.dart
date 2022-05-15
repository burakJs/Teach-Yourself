import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/init/data/abstract/firebase_service.dart';
import '../../../core/init/data/concrete/firebase_manager.dart';
import 'login_state.dart';
import '../../../product/data/auth/abstract/auth_service.dart';
import '../../../product/data/auth/concrete/auth_manager.dart';
import '../../../product/enums/person_type_enum.dart';

import '../../../core/init/navigation/navigation_manager.dart';
import '../../../product/constant/navigation_constants.dart';
import '../../../product/model/person.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({AuthService? authService, FirebaseService? fireService})
      : _service = authService ?? AuthManager(service: fireService ?? FirebaseManager()),
        super(LoginInitial());

  final AuthService _service;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> checkUserLogined() async {
    emit(LoginLoading());
    Person? person = await _service.getPerson();
    if (person == null) {
      emit(LoginInitial());
    } else {
      navigatePage(person);
    }
  }

  Future<void> login() async {
    emit(LoginLoading());
    if (emailController.text != '' && passwordController.text != '') {
      String? error = await _service.login(emailController.text, passwordController.text);
      if (error != null) {
        emit(LoginError(error: error));
      } else {
        Person? person = await _service.getPerson();
        navigatePage(person);
      }
    } else {
      emit(LoginError(error: 'Check all credentials'));
    }
  }

  void clearTextfield() {
    emailController.text = '';
    passwordController.text = '';
  }

  void navigatePage(Person? person) {
    emit(LoginSuccess(person: person));

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

    emit(LoginInitial());
    clearTextfield();
  }

  void goToRegister() {
    NavigationManager.instance.navigateToPage(NavigationConstants.REGISTER);
  }

  Future<String?> resetPass() async {
    if (emailController.text.trim() == '') {
      return 'Please check email';
    }
    String? result = await _service.resetPassword(emailController.text.trim());
    return result;
  }
}
