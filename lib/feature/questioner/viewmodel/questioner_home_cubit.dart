import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'questioner_home_state.dart';
import '../../../product/data/auth/abstract/auth_service.dart';
import '../../../product/enums/question_level_enum.dart';

import '../../../core/init/data/abstract/firebase_service.dart';
import '../../../core/init/data/abstract/storage_service.dart';
import '../../../core/init/data/concrete/firebase_manager.dart';
import '../../../core/init/data/concrete/storage_manager.dart';
import '../../../product/data/question/abstract/question_service.dart';
import '../../../product/data/question/concrete/question_manager.dart';
import '../../../product/model/question.dart';

class QuestionerHomeCubit extends Cubit<QuestionerHomeState> {
  QuestionerHomeCubit(
      {QuestionService? questionService,
      AuthService? authService,
      FirebaseService? firebaseService,
      StorageService? storageService})
      : _questionService = questionService ??
            QuestionManager(
              firebaseService: firebaseService ?? FirebaseManager(),
              storageService: storageService ?? StorageManager(),
            ),
        super(QuestionerHomeInitial());

  final QuestionService _questionService;
  final TextEditingController questionText = TextEditingController();
  final TextEditingController optionA = TextEditingController();
  final TextEditingController optionB = TextEditingController();
  final TextEditingController optionC = TextEditingController();
  final TextEditingController optionD = TextEditingController();
  int correct = 0;

  void setCorrect(int val) {
    correct = val;
  }

  Future<void> uploadQuestion(String? url) async {
    Question question = Question(
      questionText: questionText.text,
      answers: [optionA.text, optionB.text, optionC.text, optionD.text],
      correctAnswer: correct,
      createdTime: Timestamp.now(),
      level: QuestionLevel.oneDay,
      isConfirmed: false,
      image: url,
    );
    emit(QuestionerHomeLoading());
    final String? error = await _questionService.uploadQuestion(question);
    if (error != null) {
      emit(QuestionerHomeError(error: error));
    } else {
      emit(QuestionerHomeSuccess(question: question));
      clearTextfield();
    }
  }

  Future<void> uploadImage() async {
    emit(QuestionerHomeImageLoading());
    final String? url = await _questionService.uploadImage();
    if (!(url ?? 'not fount').contains('not found')) {
      emit(QuestionerHomeImageSuccess(imageUrl: url));
    } else {
      emit(QuestionerHomeInitial());
    }
  }

  void clearTextfield() {
    questionText.text = '';
    optionA.text = '';
    optionB.text = '';
    optionC.text = '';
    optionD.text = '';
  }
}
