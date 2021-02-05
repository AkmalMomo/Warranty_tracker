import 'package:flutter/material.dart';
import 'package:warranty_tracker/uipage/categorypage/catdisppage.dart';
import 'package:warranty_tracker/uipage/categorypage/categorylist.dart';

class CategorySelect extends StatelessWidget {
  String uid;
  int cat1 = 1;
  int cat2 = 2;
  int cat3 = 3;
  int cat4 = 4;
  CategorySelect({this.uid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'Select Category',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.grey[400],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
        children: <Widget>[
          Column(
            children: <Widget>[
              ButtonTheme(
                height: 50,
                minWidth: 200,
                child: OutlineButton(
                  child: Text(
                    'Computer Hardware',
                    style: TextStyle(fontSize: 20),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  borderSide: BorderSide(
                    color: Colors.red[500],
                    width: 5,
                    style: BorderStyle.solid,
                  ),
                  onPressed: () async {
                    //call the category.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CatDispPage(
                          catindex: cat1,
                          uid: uid,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ButtonTheme(
                height: 50,
                minWidth: 200,
                child: OutlineButton(
                  child: Text(
                    'Electronic Appliances',
                    style: TextStyle(fontSize: 20),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  borderSide: BorderSide(
                    color: Colors.blue[500],
                    width: 5,
                    style: BorderStyle.solid,
                  ),
                  onPressed: () async {
                    //call the category.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CatDispPage(
                          catindex: cat2,
                          uid: uid,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ButtonTheme(
                height: 50,
                minWidth: 200,
                child: OutlineButton(
                  child: Text(
                    'Cars',
                    style: TextStyle(fontSize: 20),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  borderSide: BorderSide(
                    color: Colors.yellow[500],
                    width: 5,
                    style: BorderStyle.solid,
                  ),
                  onPressed: () async {
                    //call the category.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CatDispPage(
                          catindex: cat3,
                          uid: uid,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ButtonTheme(
                height: 50,
                minWidth: 200,
                child: OutlineButton(
                  child: Text(
                    'Furniture',
                    style: TextStyle(fontSize: 20),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  borderSide: BorderSide(
                    color: Colors.green[500],
                    width: 5,
                    style: BorderStyle.solid,
                  ),
                  onPressed: () async {
                    //call the category.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CatDispPage(
                          catindex: cat4,
                          uid: uid,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
