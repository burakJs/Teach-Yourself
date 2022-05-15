import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/init/data/abstract/firebase_service.dart';
import '../../../enums/person_type_enum.dart';
import '../../../model/person.dart';
import '../abstract/auth_service.dart';

class AuthManager extends AuthService {
  AuthManager({required FirebaseService service}) : super(service: service);

  @override
  Future<String?> login(String email, String password) async {
    final result = await service.login(email, password);
    if (result != null) {
      return result;
    }

    return null;
  }

  @override
  Future<String?> registerAndSave(Person person) async {
    String collectionName;

    //TODO: switch case to extension
    switch (person.type) {
      case PersonType.admin:
        collectionName = firebaseConstants.adminCollection;
        break;
      case PersonType.questioner:
        collectionName = firebaseConstants.questionerCollection;
        break;
      case PersonType.student:
        collectionName = firebaseConstants.studentCollection;
        break;
    }
    final bool isExistUsername = await isExist('username', person.username);
    final bool isExistEmail = await isExist('username', person.email ?? '');
    if (isExistUsername) {
      return 'This username is exists';
    } else if (isExistEmail) {
      return 'This email is exists';
    }

    String? isError = await service.register(person);

    if (isError != null) return isError;

    await service.login(person.email ?? '', person.password ?? '');

    if (service.auth.currentUser == null) {
      return 'Unexpected Error when login';
    }

    await service.saveDataOneCollection(collectionName, service.auth.currentUser!.uid, person.toJson());
    return null;
  }

  @override
  Future<Person?>? getPerson() async {
    if (service.auth.currentUser == null) return null;

    Map<String, dynamic>? result =
        await service.getDataOneDocument(firebaseConstants.adminCollection, service.auth.currentUser!.uid);
    if (result != null) {
      return Person.fromJson(result);
    }
    result = await service.getDataOneDocument(firebaseConstants.questionerCollection, service.auth.currentUser!.uid);
    if (result != null) {
      return Person.fromJson(result);
    }
    result = await service.getDataOneDocument(firebaseConstants.studentCollection, service.auth.currentUser!.uid);
    if (result != null) {
      return Person.fromJson(result);
    }
    return null;
  }

  @override
  Future<String?> resetPassword(String email) async {
    try {
      await service.auth.sendPasswordResetEmail(email: email);
    } on FirebaseException catch (e) {
      return e.message;
    }
    return null;
  }
}
