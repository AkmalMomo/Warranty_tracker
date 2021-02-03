import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'package:warranty_tracker/services/uploader.dart';

class Uploading extends StatefulWidget {
  @override
  _UploadingState createState() => _UploadingState();
}

class _UploadingState extends State<Uploading> {
  @override

  //variable declaration
  int _value = 1;
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  File _image;
  String text, _info;
  String filename;
  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();
  var _categories = ['Computer', 'Appliances', 'Cars', 'Furniture'];

  //Imagepicker from Gallery
  void getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  //Imagepicker from Camera
  void getCamera() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        final String formatted = formatter.format(selectedDate);
        _date.value = TextEditingValue(text: formatted.toString());
      });
  }

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.grey[400],
            title: Text(
              'Register Warranty',
              style: TextStyle(color: Colors.black),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    getCamera();
                  },
                  icon: Icon(Icons.camera_alt),
                  label: Text('Camera'),
                ),
                FlatButton.icon(
                  onPressed: () {
                    getImage();
                  },
                  icon: Icon(Icons.image),
                  label: Text('Gallery'),
                ),
              ],
            ),
          ),
          body: ListView(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: _image != null
                        ? Image.file(
                            _image,
                            width: 200,
                            height: 200,
                          )
                        : Image.asset(
                            'assets/WarrantyHouseLogo800px.png',
                            height: 200,
                            width: 200,
                          ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            maxLength: 20,
                            validator: (val) =>
                                val.isEmpty ? 'Enter Product Name' : null,
                            onChanged: (val) => setState(() => text = val),
                            decoration: InputDecoration(
                                labelText: 'Product Name',
                                counterText: "",
                                hintText: 'Please enter less than 20 char'),
                          ),
                          GestureDetector(
                            onTap: () => _selectDate(context),
                            child: AbsorbPointer(
                              child: TextFormField(
                                controller: _date,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  labelText: 'Expiry Date',
                                ),
                              ),
                            ),
                          ),
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              labelText: 'Category',
                              labelStyle: TextStyle(fontSize: 22),
                            ),
                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text("Computer Hardware"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Electronic Appliances"),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                child: Text("Cars"),
                                value: 3,
                              ),
                              DropdownMenuItem(
                                child: Text("Furniture"),
                                value: 4,
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            },
                          ),
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter Warranty Info' : null,
                            onChanged: (val) => setState(() => _info = val),
                            decoration: InputDecoration(
                              labelText: 'Warranty Info',
                            ),
                          ),
                          Uploader(
                            file: _image,
                            name: text,
                            date: _date.text,
                            category: _value,
                            info: _info,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
