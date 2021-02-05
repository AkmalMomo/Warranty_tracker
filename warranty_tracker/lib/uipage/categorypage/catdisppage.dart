import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warranty_tracker/model/picture.dart';
import 'package:warranty_tracker/services/database.dart';
import 'package:warranty_tracker/uipage/categorypage/categorylist.dart';

class CatDispPage extends StatelessWidget {
  int catindex;
  String uid;
  CatDispPage({this.catindex, this.uid});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Picture>>.value(
      value: DatabaseService(uid: uid).picture,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[400],
          title: Text(
            'Category Display Page',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          child: Categorylist(
            catindex: catindex,
          ),
        ),
      ),
    );
  }
}
