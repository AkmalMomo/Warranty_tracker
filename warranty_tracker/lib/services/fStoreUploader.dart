import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:warranty_tracker/services/auth.dart';

class FStoreUploader extends StatelessWidget {
  String filename, name, date, info;
  int category;
  FStoreUploader(
      {this.filename, this.name, this.date, this.category, this.info});
  final CollectionReference imageData = Firestore.instance.collection('images');
  AuthService _authService = AuthService();

  //Upload to firestore
  void addImagetoFirestore() async {
    String test = _authService.userIdget().toString();
    //create a filepath
    dynamic url = await FirebaseStorage.instance
        .ref()
        .child('notimage')
        .child(filename)
        .getDownloadURL();
    print('this is the' + url.toString());

    //upload the image data
    imageData.document(filename).setData({
      'image name': filename,
      'product name': name,
      'url': url,
      'date': date,
      'category': category,
      'info': info,
      'createdAt': DateTime.now()
    });
  }

  @override
  Widget build(BuildContext context) {
    addImagetoFirestore();
    return Text('Upload Complete');
  }
}
