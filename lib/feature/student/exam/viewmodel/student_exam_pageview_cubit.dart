import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:teach_yourself/core/init/navigation/navigation_manager.dart';
import 'package:teach_yourself/product/constant/navigation_constants.dart';
import 'package:teach_yourself/product/model/question.dart';

class StudentExamPageViewCubit extends Cubit<int> {
  StudentExamPageViewCubit() : super(0);
  final PageController controller = PageController(initialPage: 0);
  int pageIndex = 0;
  int selectedOption = 0;
  List<Question> rightQuestions = [];
  List<Question> wrongQuestions = [];
  late Question tempQuestion;

  void nextPage(int maxQuestion) {
    if (maxQuestion == state) {
      // Sonuç sayfa yönlendirme
      NavigationManager.instance
          .navigateToPage(NavigationConstants.STUDENT_EXAM_RESULT, data: {'right': rightQuestions, 'wrong': wrongQuestions});
      return;
    }

    emit(state + 1);
    controller.nextPage(duration: const Duration(microseconds: 1000), curve: Curves.bounceIn);
    setPage(state);
    saveQuestion();
  }

  void setPage(int index) {
    pageIndex = index;
    emit(index);
  }

  void setSelectedOption(int option, Question question) {
    selectedOption = option;
    tempQuestion = question;
  }

  void saveQuestion() {
    if (selectedOption == tempQuestion.correctAnswer) {
      rightQuestions.add(tempQuestion);
    } else {
      wrongQuestions.add(tempQuestion);
    }

    selectedOption = -1;
  }
}
