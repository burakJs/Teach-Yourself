import '../../../product/model/person.dart';

abstract class RegisterState {
  RegisterState();
}

class RegisterInitial extends RegisterState {
  RegisterInitial();
}

class RegisterLoading extends RegisterState {
  RegisterLoading();
}

class RegisterSuccess extends RegisterState {
  final Person person;
  RegisterSuccess({required this.person});
}

class RegisterDropdownChanged extends RegisterState {
  final int index;
  RegisterDropdownChanged({required this.index});
}

class RegisterError extends RegisterState {
  final String error;
  RegisterError({required this.error});
}
