import 'package:flutter/material.dart';
import 'package:warranty_tracker/model/picture.dart';
import 'package:warranty_tracker/uipage/warrantylist/detailpage.dart';

class CategoryDisplay extends StatelessWidget {
  final Picture catwarranty;
  int catindex;
  void categoryList() {}
  CategoryDisplay({this.catwarranty, this.catindex});
  @override
  Widget build(BuildContext context) {
    if (catwarranty.category == catindex) {
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
                            picture: catwarranty,
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
                      catwarranty.url,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    catwarranty.name,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
    } else
      return Container(
        height: 0,
        width: 0,
      );
  }
}
