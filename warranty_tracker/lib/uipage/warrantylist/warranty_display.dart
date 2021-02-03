import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:warranty_tracker/model/picture.dart';

class WarrantyDisp extends StatelessWidget {
  final Picture picture;
  WarrantyDisp({this.picture});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                height: 125.0,
                width: 125.0,
                child: Image.network(
                  picture.url,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                picture.name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ]),
    );
  }
}
