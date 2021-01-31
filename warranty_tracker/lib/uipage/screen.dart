import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warranty_tracker/model/user.dart';
import 'package:warranty_tracker/uipage/home.dart';
import 'package:warranty_tracker/uipage/signin.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return SignIn();
    } else {
      return Homepage();
    }
  }
}
