import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warranty_tracker/services/auth.dart';
import 'package:warranty_tracker/model/user.dart';
import 'package:warranty_tracker/uipage/signin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: SignIn(),
      ),
    );
  }
}
