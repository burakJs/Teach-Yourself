import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teach_yourself/core/init/data/abstract/firebase_service.dart';
import 'package:teach_yourself/product/model/person.dart';

class FirebaseManager extends FirebaseService {
  @override
  Future<String?> login(Person person) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: person.email,
        password: person.password,
      );
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  @override
  Future<String?> register(Person person) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: person.email,
        password: person.password,
      );
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getDataFromOneCollection(String collection) async {
    final result = await firestore.collection(collection).get();
    return result.docs;
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getDataFromTwoCollection(
      String firstCollection, String secondCollection, String document) async {
    final result = await firestore.collection(firstCollection).doc(document).collection(secondCollection).get();
    return result.docs;
  }

  @override
  Future<Map<String, dynamic>?> getDataOneDocument(String collection, String document) async {
    final result = await firestore.collection(collection).doc(document).get();
    return result.data();
  }

  @override
  Future<Map<String, dynamic>?> getDataTwoDocument(
      String firstCollection, String firstDocumnet, String secondCollection, String secondDocument) async {
    final result =
        await firestore.collection(firstCollection).doc(firstDocumnet).collection(secondCollection).doc(secondDocument).get();
    return result.data();
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getDataFromOneCollectionByValue<T>(
      String collection, String property, T value) async {
    final result = await firestore.collection(collection).where(property, isEqualTo: value).get();
    return result.docs;
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getDataFromTwoCollectionByValue<T>(
      String firstCollection, String document, String secondCollection, String property, T value) async {
    final result = await firestore
        .collection(firstCollection)
        .doc(document)
        .collection(secondCollection)
        .where(property, isEqualTo: value)
        .get();
    return result.docs;
  }

  @override
  Future<void> saveDataOneCollection(String collection, String document, Map<String, dynamic> model) async {
    await firestore.collection(collection).doc(document).set(model);
  }

  @override
  Future<void> saveDataTwoCollection(
      String firstCollection, String document, String secondCollection, Map<String, dynamic> model) async {
    await firestore.collection(firstCollection).doc(document).collection(secondCollection).doc(document).set(model);
  }

  @override
  Future<void> updateDataOneDocument(String collection, String document, Map<String, dynamic> model) async {
    await firestore.collection(collection).doc(document).update(model);
  }

  @override
  Future<void> updateDataTwoDocument(String firstCollection, String firstDocument, String secondCollection, String secondDocument,
      Map<String, dynamic> model) async {
    await firestore.collection(firstCollection).doc(firstDocument).collection(secondCollection).doc(secondDocument).update(model);
  }

  @override
  Future<void> deleteDataOneDocument(String collection, String document) async {
    await firestore.collection(collection).doc(document).delete();
  }

  @override
  Future<void> deleteDataTwoDocument(
      String firstCollection, String firstDocument, String secondCollection, String secondDocument) async {
    await firestore.collection(firstCollection).doc(firstDocument).collection(secondCollection).doc(secondDocument).delete();
  }
}
