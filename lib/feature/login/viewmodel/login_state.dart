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
  final String? uid;
  LoginSuccess({required this.uid});
}

class LoginError extends LoginState {
  final String error;
  LoginError({required this.error});
}
