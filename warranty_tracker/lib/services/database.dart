import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warranty_tracker/model/picture.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
//Collection reference
  final CollectionReference warrantyCollection =
      Firestore.instance.collection('WarrantyTracker');

  List<Picture> _warrantyListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Picture(name: doc.data['name'], info: doc.data['info']);
    }).toList();
  }

  Future updateUserData(String name) async {
    return await warrantyCollection.document(uid).setData({'name': name});
  }

  Stream<List<Picture>> get picture {
    return warrantyCollection.snapshots().map(_warrantyListFromSnapshot);
  }
}
