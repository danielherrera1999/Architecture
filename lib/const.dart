
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class FirebaseConst {
  static const String post = "post";
}

void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue[500],
      textColor: Colors.white,
      fontSize: 16.0);
}