import 'package:flutter/material.dart';

// https://flutterchina.club/widgets-intro/

class LearnWidget3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new WScaffold3();
  }

}

class WScaffold3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new WAppBar3(
            titleWidget: new Text(
                "大家好",
                style: Theme.of(context).primaryTextTheme.title
            ),
          ),
          new Expanded(
              child: new Center(
                child: new Text(
                    "Hello MyScaffold"
                ),
              )
          )
        ],
      ),
    );
  }
}



class WAppBar3 extends StatelessWidget {

  WAppBar3({this.titleWidget});

  final Widget titleWidget;

  @override
  Widget build(BuildContext context) {
    double stateBarHeight = MediaQuery.of(context).padding.top;
    print(stateBarHeight);
    return new Container(
      height: 56.0+stateBarHeight,
      padding: EdgeInsets.fromLTRB(8, stateBarHeight, 8, 0),
      //padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue),
      child: new Row(
        children: <Widget>[
          new IconButton(
              color: Colors.white,
              icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.pop(context)
          ),
          new Expanded(
              child: titleWidget
          ),
          new IconButton(
              icon: new Icon(Icons.search,color: Colors.white),
              onPressed: null
          )
        ],
      ),
    );
  }
}