import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:warranty_tracker/services/auth.dart';
import 'package:warranty_tracker/uipage/categorypage/categoryselect.dart';
import 'package:warranty_tracker/uipage/warrantypage.dart';
import 'package:warranty_tracker/uipage/warrantypick.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String passUid;
  final AuthService _auth = AuthService();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: Text(
          'Warranty House',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
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
                    'Warranty Page',
                    style: TextStyle(fontSize: 20),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  borderSide: BorderSide(
                    color: Colors.red[500],
                    width: 5,
                    style: BorderStyle.solid,
                  ),
                  onPressed: () async {
                    FirebaseUser user = await auth.currentUser();
                    passUid = user.uid;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WarrantyPage(
                          uid: passUid,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              ButtonTheme(
                height: 50,
                minWidth: 200,
                child: OutlineButton(
                  child: Text(
                    'Category Page',
                    style: TextStyle(fontSize: 20),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  borderSide: BorderSide(
                    color: Colors.blue[500],
                    width: 5,
                    style: BorderStyle.solid,
                  ),
                  onPressed: () async {
                    FirebaseUser user = await auth.currentUser();
                    passUid = user.uid;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategorySelect(
                          uid: passUid,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              ButtonTheme(
                height: 50,
                minWidth: 200,
                child: OutlineButton(
                  child: Text(
                    'Store List',
                    style: TextStyle(fontSize: 20),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  borderSide: BorderSide(
                    color: Colors.yellow[500],
                    width: 5,
                    style: BorderStyle.solid,
                  ),
                  onPressed: () async {
                    FirebaseUser user = await auth.currentUser();
                    passUid = user.uid;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WarrantyPage(
                                  uid: passUid,
                                )));
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
                label: Text('New Warranty'),
                icon: Icon(Icons.upload_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Uploading()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
