import 'package:flutter/material.dart';

class ActionType<T> {
  dynamic type;
  T data;

  ActionType({@required this.type,this.data});

}