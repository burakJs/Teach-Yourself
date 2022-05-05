import 'package:bloc/bloc.dart';
import '../../../../core/init/data/abstract/firebase_service.dart';
import '../../../../core/init/data/abstract/storage_service.dart';
import '../../../../core/init/data/concrete/firebase_manager.dart';
import '../../../../core/init/data/concrete/storage_manager.dart';
import 'admin_home_state.dart';
import '../../../../product/data/auth/abstract/auth_service.dart';
import '../../../../product/data/auth/concrete/auth_manager.dart';
import '../../../../product/data/question/abstract/question_service.dart';
import '../../../../product/data/question/concrete/question_manager.dart';
import '../../../../product/model/question.dart';

class AdminHomeCubit extends Cubit<AdminHomeState> {
  AdminHomeCubit(
      {QuestionService? questionService,
      FirebaseService? firebaseService,
      AuthService? authService,
      StorageService? storageService})
      : _questionService = questionService ??
            QuestionManager(
              firebaseService: firebaseService ?? FirebaseManager(),
              storageService: storageService ?? StorageManager(),
            ),
        _authService = authService ?? AuthManager(service: firebaseService ?? FirebaseManager()),
        super(AdminHomeInitial());

  final QuestionService _questionService;
  final AuthService _authService;
  Future<void> loadConfirmedQuestion() async {
    emit(AdminHomeLoading());
    List<Question> questionList = await _questionService.getAllConfirmedQuestion();
    emit(AdminHomeSuccess(questionList: questionList));
  }
}
