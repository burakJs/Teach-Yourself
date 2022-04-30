import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

abstract class StorageService {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  UploadTask? uploadImage(String dest, File image);
}
