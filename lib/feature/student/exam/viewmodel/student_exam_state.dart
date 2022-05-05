import 'package:teach_yourself/product/model/question.dart';

abstract class StudentExamState {
  StudentExamState();
}

class StudentExamInitial extends StudentExamState {
  StudentExamInitial();
}

class StudentExamLoading extends StudentExamState {
  StudentExamLoading();
}

class StudentExamSuccess extends StudentExamState {
  final List<Question>? questionList;
  StudentExamSuccess({required this.questionList});
}

class StudentExamError extends StudentExamState {
  final String error;
  StudentExamError({required this.error});
}
