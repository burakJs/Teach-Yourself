import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class StudentExamPageViewCubit extends Cubit<int> {
  StudentExamPageViewCubit() : super(0);
  final PageController controller = PageController(initialPage: 0);
  int pageIndex = 0;

  void nextPage(int maxQuestion) {
    if (maxQuestion - 1 == state) {
      return;
    }

    emit(state + 1);
    controller.nextPage(duration: const Duration(microseconds: 1000), curve: Curves.bounceIn);
    setPage(state);
  }

  void previousPage() {
    if (state - 1 == -1) {
      return;
    }

    emit(state - 1);
    controller.previousPage(duration: const Duration(microseconds: 100), curve: Curves.bounceIn);
    setPage(state);
  }

  void setPage(int index) {
    pageIndex = index;
    emit(index);
  }
}
