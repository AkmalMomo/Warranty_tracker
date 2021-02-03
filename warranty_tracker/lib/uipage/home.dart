import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warranty_tracker/model/picture.dart';
import 'package:warranty_tracker/services/auth.dart';
import 'package:warranty_tracker/services/database.dart';
import 'package:warranty_tracker/uipage/warrantylist/warranty_list.dart';
import 'package:warranty_tracker/uipage/warrantypick.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Picture>>.value(
      value: DatabaseService().picture,
      child: Scaffold(
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
        body: Container(
          child: WarrantyList(),
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
      ),
    );
  }
}
