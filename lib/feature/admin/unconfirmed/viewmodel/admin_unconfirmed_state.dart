import 'package:teach_yourself/product/model/question.dart';

abstract class AdminUnconfirmedState {
  AdminUnconfirmedState();
}

class AdminUnconfirmedInitial extends AdminUnconfirmedState {
  AdminUnconfirmedInitial();
}

class AdminUnconfirmedLoading extends AdminUnconfirmedState {
  AdminUnconfirmedLoading();
}

class AdminUnconfirmedSuccess extends AdminUnconfirmedState {
  final List<Question>? unconfirmedList;
  AdminUnconfirmedSuccess({required this.unconfirmedList});
}

class AdminUnconfirmedError extends AdminUnconfirmedState {
  final String error;
  AdminUnconfirmedError({required this.error});
}
