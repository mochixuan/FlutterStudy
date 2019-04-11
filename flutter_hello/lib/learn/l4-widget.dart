import 'package:flutter/material.dart';

class LearnWidget4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
              color: Colors.white,
              icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.pop(context)
          ),
          title: new Text(
            "状态组件",
            style: Theme.of(context).primaryTextTheme.title
          ),
        ),
        body: new Counter(),
    );
  }
  
}

class Counter extends StatefulWidget {
  @override
  _CountState createState() {
    return new _CountState();
  }
}

class CounterDisplay extends StatelessWidget {

  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return new Text(
      "count: $count",
      style: new TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold
      )
    );
  }
}

class CounterIncrementor extends StatelessWidget {

  final VoidCallback onPressed;

  CounterIncrementor({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
        onPressed: onPressed,
        child: new Text("Increment"),
    );
  }
}

class _CountState extends State<Counter> {

  int _counter = 0;

  void _increment() {
    //通知刷新
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
          child: new Column(
            children: <Widget>[
              new CounterDisplay(count: _counter),
              new CounterIncrementor(onPressed: _increment)
            ],
          ),
        )
      ,
    );
  }

}