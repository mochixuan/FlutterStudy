import 'package:flutter/material.dart';

class UiUtils {

  static double getSafeBottomHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double getSafeTopHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

}