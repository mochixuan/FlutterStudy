import 'package:flutter/material.dart';
import 'dart:async';

class StreamLearn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    StreamSubscription streamSubscription;
    StreamController<String> streamController;
    StreamSink streamSink;
    Stream<String> _streamData = Stream.fromFuture(_getUserInfo());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: Colors.white,
            icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context)
        ),
        title: new Text("StreamLearn"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _getUserInfo()
                    .then((data){
                      debugPrint('_getUserInfo Base: '+data);
                    });
              },
            ),
            IconButton(
              icon: Icon(Icons.accessibility),
              onPressed: () {
                Stream<String> _streamData = Stream.fromFuture(_getUserInfo());
                _streamData.listen(
                  (String text){ debugPrint('_getUserInfo receiver: '+text); },
                  onError: (error) {debugPrint('_getUserInfo onError: '+error);},
                  onDone: () {debugPrint('_getUserInfo onDone: ');},
                  cancelOnError: false
                );

              },
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(onPressed: (){
                  Stream<String> _streamData = Stream.fromFuture(_getUserInfo());
                  streamSubscription = _streamData.listen(
                          (String text){ debugPrint('_getUserInfo receiver: '+text); },
                      onError: (error) {debugPrint('_getUserInfo onError: '+error);},
                      onDone: () {debugPrint('_getUserInfo onDone: ');},
                      cancelOnError: false
                  );
                  }, child: Text("赋值")),
                RaisedButton(onPressed: (){streamSubscription.pause();}, child: Text("暂停")),
                RaisedButton(onPressed: (){streamSubscription.resume();}, child: Text("重新开始")),
                RaisedButton(onPressed: (){streamSubscription.cancel();}, child: Text("取消"))
              ],
            ),

            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(onPressed: (){
                  streamController = StreamController<String>();
                  streamController.stream.listen(
                      (String text){ debugPrint('_getUserInfo finish: '+text); },
                      onError: (error) {debugPrint('_getUserInfo onError: '+error);},
                      onDone: () {debugPrint('_getUserInfo onDone: ');},
                      cancelOnError: false
                  );
                  streamSink = streamController.sink;
                }, child: Text("赋值")),
                RaisedButton(onPressed: (){
                  streamController.add("我是谁");
                  }, child: Text("我是谁")),
                RaisedButton(onPressed: (){
                  streamSink.add("王旋");
                }, child: Text("结束")),
              ],
            ),
            StreamBuilder(
              initialData: '.......',
              stream: _streamData,
              builder: (context,snapShot) {
                return Text(snapShot.data);
              },
            )
          ],
        ),
      ),
    );
  }

  Future<String> _getUserInfo() async{
    debugPrint('_getUserInfo init');
    await Future.delayed(Duration(milliseconds: 3000));
    // throw "我是来搞事情的。";
    return "我是用户";
  }

}