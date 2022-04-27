import 'package:bloc/bloc.dart';
import 'package:teach_yourself/core/init/data/abstract/firebase_service.dart';
import 'package:teach_yourself/core/init/data/concrete/firebase_manager.dart';
import 'package:teach_yourself/product/data/question/abstract/question_service.dart';
import 'package:teach_yourself/product/data/question/concrete/question_manager.dart';

import '../../../../product/model/question.dart';
import 'admin_unconfirmed_state.dart';

class AdminUnconfirmedCubit extends Cubit<AdminUnconfirmedState> {
  AdminUnconfirmedCubit({QuestionService? questionService, FirebaseService? firebaseService})
      : _service = questionService ?? QuestionManager(service: firebaseService ?? FirebaseManager()),
        super(AdminUnconfirmedInitial());
  final QuestionService _service;

  Future<void> getUnconfirmedList() async {
    emit(AdminUnconfirmedLoading());
    List<Question> questionList = await _service.getAllUnconfirmedQuestion();
    emit(AdminUnconfirmedSuccess(unconfirmedList: questionList));
  }

  Future<void> setConfirmed(Question question) async {
    _service.setQuestionToConfirmed(question);
    getUnconfirmedList();
  }
}
