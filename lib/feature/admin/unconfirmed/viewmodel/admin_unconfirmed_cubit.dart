import 'package:bloc/bloc.dart';
import '../../../../core/init/data/abstract/firebase_service.dart';
import '../../../../core/init/data/concrete/firebase_manager.dart';
import '../../../../core/init/data/concrete/storage_manager.dart';
import '../../../../product/data/question/abstract/question_service.dart';
import '../../../../product/data/question/concrete/question_manager.dart';

import '../../../../core/init/data/abstract/storage_service.dart';
import '../../../../product/model/question.dart';
import 'admin_unconfirmed_state.dart';

class AdminUnconfirmedCubit extends Cubit<AdminUnconfirmedState> {
  AdminUnconfirmedCubit({QuestionService? questionService, FirebaseService? firebaseService, StorageService? storageService})
      : _service = questionService ??
            QuestionManager(
              firebaseService: firebaseService ?? FirebaseManager(),
              storageService: storageService ?? StorageManager(),
            ),
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
