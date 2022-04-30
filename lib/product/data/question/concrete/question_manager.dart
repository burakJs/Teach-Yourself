import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:teach_yourself/core/init/data/abstract/storage_service.dart';

import '../../../../core/init/data/abstract/firebase_service.dart';
import '../abstract/question_service.dart';
import '../../../model/question.dart';

class QuestionManager extends QuestionService {
  QuestionManager({required FirebaseService firebaseService, required StorageService storageService})
      : super(firebaseService: firebaseService, storageService: storageService);

  @override
  Future<List<Question>> getAllConfirmedQuestion() async {
    final List<Question> questionList = [];
    Question newQuestion;
    final result = await firebaseService.getDataFromTwoCollection(
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
    final result = await firebaseService.getDataFromTwoCollection(firebaseConstants.questionCollection,
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
    firebaseService.saveDataTwoCollection(
      firebaseConstants.questionCollection,
      firebaseConstants.questionDocument,
      firebaseConstants.confirmedQuestionCollection,
      model,
    );
    firebaseService.deleteDataTwoDocument(
      firebaseConstants.questionCollection,
      firebaseConstants.questionDocument,
      firebaseConstants.unconfirmedQuestionCollection,
      question.uid!,
    );
    return null;
  }

  @override
  Future<String?> uploadImage() async {
    ImagePicker _picker = ImagePicker();
    final result = await _picker.pickImage(source: ImageSource.gallery);
    if (result == null) return 'Image is not found';
    File image = File(result.path);

    final task = storageService.uploadImage('images/${result.name}', image);
    final snapshot = await task?.whenComplete(() {});
    final url = await snapshot?.ref.getDownloadURL();
    return url;
  }

  @override
  Future<String?> uploadQuestion(Question question) async {
    await firebaseService.saveDataTwoCollection(firebaseConstants.questionCollection, firebaseConstants.questionDocument,
        firebaseConstants.unconfirmedQuestionCollection, question.toJson());

    return null;
  }
}
