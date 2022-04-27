import '../../../product/model/person.dart';

abstract class LoginState {
  LoginState();
}

class LoginInitial extends LoginState {
  LoginInitial();
}

class LoginLoading extends LoginState {
  LoginLoading();
}

class LoginSuccess extends LoginState {
  final Person? person;
  LoginSuccess({required this.person});
}

class LoginError extends LoginState {
  final String error;
  LoginError({required this.error});
}
