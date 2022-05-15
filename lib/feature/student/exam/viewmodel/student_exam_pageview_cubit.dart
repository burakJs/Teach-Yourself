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
  final int maxQuestion = 10;
  List<Question> rightQuestions = [];
  List<Question> wrongQuestions = [];
  List<Question> allQuestions = [];
  late Question tempQuestion;

  void nextPage(bool isFinished) {
    if (maxQuestion == state + 1 || isFinished) {
      // Sonuç sayfa yönlendirme
      saveQuestion();
      emit(0);

      NavigationManager.instance.navigateToPage(NavigationConstants.STUDENT_EXAM_RESULT, data: {
        'right': rightQuestions,
        'wrong': wrongQuestions,
        'all': allQuestions,
      });

      return;
    }

    emit(state + 1);
    controller.nextPage(duration: const Duration(microseconds: 1000), curve: Curves.bounceIn);
    setPage(state);
    saveQuestion();
  }

  void clearList() {
    rightQuestions = [];
    wrongQuestions = [];
    allQuestions = [];
  }

  void setPage(int index) {
    pageIndex = index;
    emit(index);
  }

  void setSelectedOption(int option, Question question, List<Question> allQuestion) {
    selectedOption = option;
    tempQuestion = question;
    allQuestions = allQuestion;
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
