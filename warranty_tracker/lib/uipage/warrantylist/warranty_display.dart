import 'package:flutter/material.dart';
import 'package:warranty_tracker/model/picture.dart';
import 'package:warranty_tracker/uipage/warrantylist/detailpage.dart';

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
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          picture: picture,
                        )));
          },
          child: Container(
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
        ),
        SizedBox(
          height: 10,
        )
      ]),
    );
  }
}
