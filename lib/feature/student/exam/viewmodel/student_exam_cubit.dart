import 'package:bloc/bloc.dart';
import 'package:teach_yourself/core/init/data/abstract/firebase_service.dart';
import 'package:teach_yourself/core/init/data/abstract/storage_service.dart';
import 'package:teach_yourself/core/init/data/concrete/firebase_manager.dart';
import 'package:teach_yourself/core/init/data/concrete/storage_manager.dart';
import 'package:teach_yourself/product/data/question/abstract/question_service.dart';
import 'package:teach_yourself/product/data/question/concrete/question_manager.dart';
import 'package:teach_yourself/product/model/question.dart';

import 'student_exam_state.dart';

class StudentExamCubit extends Cubit<StudentExamState> {
  StudentExamCubit({
    QuestionService? questionService,
    FirebaseService? firebaseService,
    StorageService? storageService,
  })  : _service = questionService ??
            QuestionManager(
              firebaseService: firebaseService ?? FirebaseManager(),
              storageService: storageService ?? StorageManager(),
            ),
        super(StudentExamInitial());

  final QuestionService _service;

  Future<void> loadQuestion() async {
    emit(StudentExamLoading());
    List<Question> questionList = await _service.getAllConfirmedQuestion();
    emit(StudentExamSuccess(questionList: questionList));
  }
}
