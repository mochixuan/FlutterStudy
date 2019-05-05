import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class RxDartLearn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RxDartState();
  }
}

class RxDartState extends State<RxDartLearn> {

  Observable<String> observable;

  @override
  void initState() {
    super.initState();

    // observable = Observable(Stream.fromIterable(['数学','语文']));
    // observable = Observable.fromFuture(Future.value('数学'));
    // observable = Observable.fromIterable(['数学','语文']);
    observable = Observable.periodic(Duration(seconds: 3),(x)=> '次数: '+x.toString());

    observable.listen(debugPrint);

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: Colors.white,
            icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context)
        ),
        title: new Text("StreamLearn"),
      ),
      body: new Container(
        child: Text("RxDart Learn"),
      ),
    );
  }
}