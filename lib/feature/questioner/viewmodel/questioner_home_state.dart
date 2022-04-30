import '../../../product/model/question.dart';

abstract class QuestionerHomeState {
  QuestionerHomeState();
}

class QuestionerHomeInitial extends QuestionerHomeState {
  QuestionerHomeInitial();
}

class QuestionerHomeLoading extends QuestionerHomeState {
  QuestionerHomeLoading();
}

class QuestionerHomeSuccess extends QuestionerHomeState {
  final Question? question;
  QuestionerHomeSuccess({required this.question});
}

class QuestionerHomeImageLoading extends QuestionerHomeState {
  QuestionerHomeImageLoading();
}

class QuestionerHomeImageSuccess extends QuestionerHomeState {
  final String? imageUrl;
  QuestionerHomeImageSuccess({required this.imageUrl});
}

class QuestionerHomeError extends QuestionerHomeState {
  final String error;
  QuestionerHomeError({required this.error});
}
