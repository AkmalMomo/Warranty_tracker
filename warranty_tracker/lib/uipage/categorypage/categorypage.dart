import 'package:flutter/material.dart';
import 'package:warranty_tracker/model/picture.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Select Category'),
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
                  onPressed: () {
                    //call the category.
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
                  onPressed: () {
                    //call the category.
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
                  onPressed: () {
                    //call the category.
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
                  onPressed: () {
                    //call the category.
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
