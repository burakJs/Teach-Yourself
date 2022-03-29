import 'package:teach_yourself/core/init/data/abstract/firebase_service.dart';

import '../../../../core/init/data/firebase_constants.dart';
import '../../../model/person.dart';

abstract class AuthService {
  final FirebaseService service;
  FirebaseConstants firebaseConstants = FirebaseConstants.instance;
  AuthService({
    required this.service,
  });

  Future<String?> registerAndSave(Person person);
  Future<String?> login(String email, String password);
  Future<Person?>? getPerson();

  Future<bool> isExist(String property, String field) async {
    final resultForAdmin =
        await service.getDataFromOneCollectionByValue<String>(firebaseConstants.adminCollection, property, field);
    final resultForQuestioner =
        await service.getDataFromOneCollectionByValue<String>(firebaseConstants.questionerCollection, property, field);
    final resultForStudent =
        await service.getDataFromOneCollectionByValue<String>(firebaseConstants.studentCollection, property, field);
    return resultForAdmin.isNotEmpty || resultForQuestioner.isNotEmpty || resultForStudent.isNotEmpty;
  }
}
