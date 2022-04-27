import 'package:teach_yourself/product/model/question.dart';

abstract class AdminHomeState {
  AdminHomeState();
}

class AdminHomeInitial extends AdminHomeState {
  AdminHomeInitial();
}

class AdminHomeLoading extends AdminHomeState {
  AdminHomeLoading();
}

class AdminHomeSuccess extends AdminHomeState {
  final List<Question>? questionList;
  AdminHomeSuccess({required this.questionList});
}

class AdminHomeError extends AdminHomeState {
  final String error;
  AdminHomeError({required this.error});
}
