import 'package:flutter/material.dart';

class Product {
  final String name;
  const Product({this.name});
}

typedef void CartChangedCallback(Product product,bool isCart);

class LearnWidget5 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new ListTile();
  }

}