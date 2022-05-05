import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import '../abstract/storage_service.dart';

class StorageManager extends StorageService {
  @override
  UploadTask? uploadImage(String dest, File image) {
    final Reference uploadRef = firebaseStorage.ref().child(dest);
    try {
      return uploadRef.putFile(image);
    } on FirebaseException catch (e) {
      print(e.message);
      return null;
    }
  }
}
