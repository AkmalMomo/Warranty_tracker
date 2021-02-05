import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warranty_tracker/model/picture.dart';
import 'package:warranty_tracker/uipage/categorypage/categorydisplay.dart';

class Categorylist extends StatefulWidget {
  int catindex;
  Categorylist({this.catindex});
  @override
  _CategorylistState createState() => _CategorylistState();
}

class _CategorylistState extends State<Categorylist> {
  @override
  Widget build(BuildContext context) {
    final catwarranty = Provider.of<List<Picture>>(context) ?? [];
    return ListView.builder(
        itemCount: catwarranty.length,
        itemBuilder: (context, index) {
          return CategoryDisplay(
            catwarranty: catwarranty[index],
            catindex: widget.catindex,
          );
        });
  }
}
