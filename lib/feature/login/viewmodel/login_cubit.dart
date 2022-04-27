import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:teach_yourself/core/init/data/abstract/firebase_service.dart';
import 'package:teach_yourself/core/init/data/concrete/firebase_manager.dart';
import 'package:teach_yourself/feature/login/viewmodel/login_state.dart';
import 'package:teach_yourself/product/data/auth/abstract/auth_service.dart';
import 'package:teach_yourself/product/data/auth/concrete/auth_manager.dart';

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
      emit(LoginSuccess(person: person));
      NavigationManager.instance.navigateToPage(NavigationConstants.ADMIN_HOME, data: person);
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
        emit(LoginSuccess(person: person));
        NavigationManager.instance.navigateToPage(NavigationConstants.ADMIN_HOME, data: person);
      }
    } else {
      emit(LoginError(error: 'Check all credentials'));
    }
  }
}
