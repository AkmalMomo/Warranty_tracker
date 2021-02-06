import 'package:flutter/material.dart';

class StoreList extends StatelessWidget {
  String uid;
  StoreList({this.uid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: Text(
          'Store List',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
                height: 300,
                width: 300,
                child: Image.network(
                    'https://pngimg.com/uploads/ghost/ghost_PNG81.png')),
            Text(
              "Coming Soon",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
