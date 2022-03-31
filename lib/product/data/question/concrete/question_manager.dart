import '../../../../core/init/data/abstract/firebase_service.dart';
import '../abstract/question_service.dart';
import '../../../model/question.dart';

class QuestionManager extends QuestionService {
  QuestionManager({required FirebaseService service}) : super(service: service);

  @override
  Future<List<Question>> getAllConfirmedQuestion() async {
    final List<Question> questionList = [];
    Question newQuestion;
    final result = await service.getDataFromTwoCollection(
        firebaseConstants.questionCollection, firebaseConstants.confirmedQuestionCollection, firebaseConstants.questionDocument);
    for (var res in result) {
      newQuestion = Question.fromJson(res.data());
      newQuestion.uid = res.id;
      questionList.add(newQuestion);
    }
    return questionList;
  }

  @override
  Future<List<Question>> getAllUnconfirmedQuestion() async {
    final List<Question> questionList = [];
    Question newQuestion;
    final result = await service.getDataFromTwoCollection(firebaseConstants.questionCollection,
        firebaseConstants.unconfirmedQuestionCollection, firebaseConstants.questionDocument);
    for (var res in result) {
      newQuestion = Question.fromJson(res.data());
      newQuestion.uid = res.id;
      questionList.add(newQuestion);
    }
    return questionList;
  }

  @override
  String? setQuestionToConfirmed(Question question) {
    if (question.uid == null) return 'Null Question UID';

    question.isConfirmed = true;
    final model = question.toJson();
    service.saveDataTwoCollection(
      firebaseConstants.questionCollection,
      firebaseConstants.questionDocument,
      firebaseConstants.confirmedQuestionCollection,
      model,
    );
    service.deleteDataTwoDocument(
      firebaseConstants.questionCollection,
      firebaseConstants.questionDocument,
      firebaseConstants.unconfirmedQuestionCollection,
      question.uid!,
    );
    return null;
  }
}
