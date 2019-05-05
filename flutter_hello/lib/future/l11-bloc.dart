import 'package:flutter/material.dart';
import 'dart:async';

class BlocLearn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BlocState();
  }
}

class BlocState extends State<BlocLearn> {

  @override
  void initState() {
    super.initState();

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
        child: ListTile(
            leading: Icon(Icons.accessibility),
            title: Text(model.name),
            subtitle: Text(model.desc),
            trailing: IconButton(
                icon: Text(model.age.toString()),
                onPressed: () {
                  model.increaseAge();
                  // 第二中方式： rebuildOnChange属性默认为false，所以会导致无法刷新（同步）状态的情况发生，需要手动指定rebuildOnChange：true
                  // final twoMethod = ScopedModel.of<PersonModel>(context);
                  // twoMethod.increaseAge();
                }
            )
        ),
      ),
    );
  }
}

class PersonBloc {

  String name = "mochixuan";
  String desc = "Android、React Native、React、Flutter、Web";
  int age = 0;
  StreamController<int> _controller;

  PersonBloc(){
    _controller = StreamController<int>();
  }

  Stream<int> get value => _controller.stream;

  increase() {
    _controller.sink.add(++age);
  }

  dispose() {
    _controller.close();
  }

}

class BlocProvider extends InheritedWidget {
  PersonBloc bloc = PersonBloc();

  BlocProvider({Key key,Widget child}) : super(key: key,child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static PersonBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bloc;

}
