import 'package:flutter/material.dart';
import 'package:warranty_tracker/model/picture.dart';

class WarrantyDisp extends StatelessWidget {
  final Picture picture;
  WarrantyDisp({this.picture});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(picture.info),
        ],
      ),
    );
  }
}
