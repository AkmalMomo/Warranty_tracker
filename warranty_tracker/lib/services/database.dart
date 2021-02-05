import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:warranty_tracker/model/picture.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  String tempurl = 'https://i.imgur.com/q9wRUnN.png';
  String useruid;
  final FirebaseAuth auth = FirebaseAuth.instance;

//Collection reference

  List<Picture> _warrantyListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Picture(
          name: doc.data['product name'] ?? '',
          info: doc.data['info'] ?? '',
          url: doc.data['url'] ?? '',
          date: doc.data['date'] ?? '',
          category: doc.data['category'] ?? '',
          filename: doc.data['image name'] ?? '',
          uid: doc.data['uid'] ?? '');
    }).toList();
  }

  Future updateUserData(String name) async {
    final CollectionReference warrantyCollection =
        Firestore.instance.collection(uid);
    return await warrantyCollection.document(uid).setData({
      'name': name,
    });
  }

  Future createUserData(String name, int category, String info) async {
    final CollectionReference warrantyCollection =
        Firestore.instance.collection(uid);
    return await warrantyCollection.document(uid).setData({
      'url': tempurl,
      'product name': name,
      'category': category,
      'info': info,
      'date': DateTime.now().toString(),
    });
  }

  Stream<List<Picture>> get picture {
    final CollectionReference warrantyCollection =
        Firestore.instance.collection(uid);
    return warrantyCollection.snapshots().map(_warrantyListFromSnapshot);
  }
}
