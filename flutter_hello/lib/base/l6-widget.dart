import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            color: Colors.white,
            icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context)
        ),
        title: new Text("动画"),
      ),
    );
  }

}

class AnimWidget1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return null;
  }
}