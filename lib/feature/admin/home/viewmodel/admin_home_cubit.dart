import 'package:bloc/bloc.dart';
import 'package:teach_yourself/core/init/data/abstract/firebase_service.dart';
import 'package:teach_yourself/core/init/data/concrete/firebase_manager.dart';
import 'package:teach_yourself/feature/admin/home/viewmodel/admin_home_state.dart';
import 'package:teach_yourself/product/data/question/abstract/question_service.dart';
import 'package:teach_yourself/product/data/question/concrete/question_manager.dart';
import 'package:teach_yourself/product/model/question.dart';

class AdminHomeCubit extends Cubit<AdminHomeState> {
  AdminHomeCubit({QuestionService? questionService, FirebaseService? firebaseService})
      : _service = questionService ?? QuestionManager(service: firebaseService ?? FirebaseManager()),
        super(AdminHomeInitial());

  final QuestionService _service;

  Future<void> loadConfirmedQuestion() async {
    emit(AdminHomeLoading());
    List<Question> questionList = await _service.getAllConfirmedQuestion();
    emit(AdminHomeSuccess(questionList: questionList));
  }
}
