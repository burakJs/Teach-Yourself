import '../../../../core/init/data/abstract/firebase_service.dart';
import '../../../model/question.dart';

import '../../../../core/init/data/firebase_constants.dart';

abstract class QuestionService {
  final FirebaseService service;
  QuestionService({
    required this.service,
  });

  FirebaseConstants firebaseConstants = FirebaseConstants.instance;

  Future<List<Question>> getAllUnconfirmedQuestion();
  Future<List<Question>> getAllConfirmedQuestion();
  String? setQuestionToConfirmed(Question question);
}
