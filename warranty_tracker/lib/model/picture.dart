import 'package:cloud_firestore/cloud_firestore.dart';

class Picture {
  final String filename;
  final String text;
  final String url;
  final Timestamp createdAt;

  Picture({this.filename, this.text, this.url, this.createdAt});
}
