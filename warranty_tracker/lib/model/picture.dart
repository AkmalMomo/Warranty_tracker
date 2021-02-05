import 'package:cloud_firestore/cloud_firestore.dart';

class Picture {
  final String filename;
  final String name;
  final String date;
  final String url;
  final int category;
  final String info;
  final String uid;
  final Timestamp createdAt;

  Picture(
      {this.filename,
      this.name,
      this.date,
      this.url,
      this.category,
      this.info,
      this.uid,
      this.createdAt});
}
