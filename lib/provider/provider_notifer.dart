import 'package:flutter/material.dart';

import '../sorting.dart';

class LoginProvider extends ChangeNotifier {
  String userName = '';
  bool visibility=true;
  void changeVisibility(){
    visibility=!visibility;
    notifyListeners();
  }

  void allowAccess(userName, context) {
    this.userName = userName;
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Sort()));
   // notifyListeners();
  }
}
