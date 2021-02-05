import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:warranty_tracker/model/picture.dart';
import 'package:intl/intl.dart';
import 'package:warranty_tracker/uipage/home.dart';

class DetailPage extends StatefulWidget {
  final Picture picture;
  DetailPage({this.picture});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //Method to classify category
  String categorizer() {
    int cat = widget.picture.category;
    String category;
    if (cat == 1) {
      category = 'Computer Hardware';
      return category;
    } else if (cat == 2) {
      category = 'Electronic Appliances';
      return category;
    } else if (cat == 3) {
      category = 'Cars';
      return category;
    } else if (cat == 4) {
      category = 'Furniture';
      return category;
    }
  }

  //Method to delete
  deleteImage() async {
    if (widget.picture.url != null) {
      StorageReference storageReference = await FirebaseStorage.instance
          .getReferenceFromUrl(widget.picture.url);
      await storageReference.delete();
    }
    await Firestore.instance
        .collection(widget.picture.uid)
        .document(widget.picture.filename)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[400],
        title: Text(
          'Detail Info',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                child: Image.network(
                  widget.picture.url,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  TextFormField(
                    enabled: false,
                    maxLength: 20,
                    validator: (val) =>
                        val.isEmpty ? 'Enter Prodcut Name' : null,
                    decoration: InputDecoration(
                        labelText: 'Product Name', counterText: ""),
                    controller:
                        TextEditingController(text: widget.picture.name),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    enabled: false,
                    validator: (val) =>
                        val.isEmpty ? 'Enter the warranty info' : null,
                    decoration: InputDecoration(labelText: 'Warranty Info'),
                    controller:
                        TextEditingController(text: widget.picture.info),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: ('Expiry Date'),
                        ),
                        controller:
                            TextEditingController(text: widget.picture.date),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: ('Category'),
                    ),
                    controller: TextEditingController(text: categorizer()),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ButtonTheme(
                    height: 40,
                    minWidth: 200,
                    child: OutlineButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      borderSide: BorderSide(
                          color: Colors.red[500],
                          width: 5,
                          style: BorderStyle.solid),
                      child: Text(
                        'Delete',
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                      onPressed: () async {
                        await deleteImage();
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
