import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../product/model/person.dart';

abstract class FirebaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> register(Person person);

  Future<String?> login(String email, String password);

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getDataFromOneCollection(String collection);

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getDataFromTwoCollection(
      String firstCollection, String secondCollection, String document);

  Future<Map<String, dynamic>?> getDataOneDocument(String collection, String document);

  Future<Map<String, dynamic>?> getDataTwoDocument(
      String firstCollection, String firstDocumnet, String secondCollection, String secondDocument);

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getDataFromOneCollectionByValue<T>(
      String collection, String property, T value);

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getDataFromTwoCollectionByValue<T>(
      String firstCollection, String document, String secondCollection, String property, T value);

  Future<void> saveDataOneCollection(String collection, String document, Map<String, dynamic> model);

  Future<void> saveDataTwoCollection(
      String firstCollection, String document, String secondCollection, Map<String, dynamic> model);

  Future<void> updateDataOneDocument(String collection, String document, Map<String, dynamic> model);

  Future<void> updateDataTwoDocument(
      String firstCollection, String firstDocument, String secondCollection, String secondDocument, Map<String, dynamic> model);

  Future<void> deleteDataOneDocument(String collection, String document);

  Future<void> deleteDataTwoDocument(
      String firstCollection, String firstDocument, String secondCollection, String secondDocument);
}
