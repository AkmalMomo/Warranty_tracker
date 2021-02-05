import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warranty_tracker/model/picture.dart';
import 'package:warranty_tracker/services/database.dart';
import 'package:warranty_tracker/uipage/warrantylist/warranty_list.dart';

class WarrantyPage extends StatelessWidget {
  String uid;
  WarrantyPage({this.uid});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Picture>>.value(
      value: DatabaseService(uid: uid).picture,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[400],
          title: Text(
            'Warranty Page',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          child: WarrantyList(),
        ),
      ),
    );
  }
}
