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

    return BlocProvider(
      child: new Scaffold(
        appBar: AppBar(
          leading: IconButton(
              color: Colors.white,
              icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.pop(context)
          ),
          title: new Text("BlocLearn"),
        ),
        body: ItemView()
      ),
    );
  }
}

class ItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PersonBloc bloc = BlocProvider.of(context);
    return StreamBuilder(
        stream: bloc.stream,
        initialData: bloc.value,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return ListTile(
              leading: Icon(Icons.accessibility),
              title: Text(bloc.name),
              subtitle: Text(bloc.desc),
              trailing: IconButton(
                  icon: Text(snapshot.data.toString()),
                  onPressed: () {
                    bloc.increase();
                  }
              )
          );
        }
    );
  }
}

class PersonBloc {

  String name = "mochixuan";
  String desc = "Android、React Native、React、Flutter、Web";
  int age = 0;
  StreamController<int> _controller;

  PersonBloc(){
    _controller = StreamController<int>.broadcast();
  }

  Stream<int> get stream => _controller.stream;
  int get value => age;

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
