import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warranty_tracker/model/picture.dart';
import 'package:warranty_tracker/uipage/warrantylist/warranty_display.dart';

class WarrantyList extends StatefulWidget {
  @override
  _WarrantyListState createState() => _WarrantyListState();
}

class _WarrantyListState extends State<WarrantyList> {
  @override
  Widget build(BuildContext context) {
    final warranty = Provider.of<List<Picture>>(context) ?? [];
    return ListView.builder(
        itemCount: warranty.length,
        itemBuilder: (context, index) {
          return WarrantyDisp(
            picture: warranty[index],
          );
        });
  }
}
