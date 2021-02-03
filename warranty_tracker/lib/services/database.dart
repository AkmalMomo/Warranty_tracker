import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:warranty_tracker/model/picture.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  String useruid;
  final FirebaseAuth auth = FirebaseAuth.instance;

//Collection reference
  final CollectionReference warrantyCollection =
      Firestore.instance.collection('WarrantyTracker');

  List<Picture> _warrantyListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Picture(
          name: doc.data['product name'],
          info: doc.data['info'],
          url: doc.data['url'],
          uid: doc.data['uid']);
    }).toList();
  }

  Future updateUserData(String name) async {
    return await warrantyCollection.document(uid).setData({'name': name});
  }

  Stream<List<Picture>> get picture {
    return warrantyCollection.snapshots().map(_warrantyListFromSnapshot);
  }
}
