import '../../../../core/init/data/abstract/firebase_service.dart';
import '../../../../core/init/data/abstract/storage_service.dart';
import '../../../../core/init/data/firebase_constants.dart';
import '../../../model/question.dart';

abstract class QuestionService {
  final FirebaseService firebaseService;
  final StorageService storageService;
  QuestionService({
    required this.firebaseService,
    required this.storageService,
  });

  FirebaseConstants firebaseConstants = FirebaseConstants.instance;

  Future<List<Question>> getAllUnconfirmedQuestion();
  Future<List<Question>> getAllConfirmedQuestion();
  String? setQuestionToConfirmed(Question question);
  Future<String?> uploadImage();
  Future<String?> uploadQuestion(Question question);
  Future<List<Question>> get10RandomQuestions();
}
