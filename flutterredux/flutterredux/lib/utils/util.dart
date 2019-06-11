import 'package:flutter/material.dart';

class Util {

  static showToast(BuildContext context,String data) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
          content: Text(data,style: TextStyle(fontSize: 16,color: Colors.red))
      )
    );
  }

}