import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math';

class BlocLearn1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    PersonBloc _personBloc = PersonBloc();

    return BlocProvider(
      bloc: _personBloc,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              color: Colors.white,
              icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.pop(context)
          ),
          title: new Text("Redux Lean"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                onPressed: (){
                  PersonModel _personModal = PersonModel(
                    name: WordPair.random().asPascalCase,
                    desc: WordPair.random().asPascalCase+" very good",
                    age: Random().nextInt(100)
                  );
                  _personBloc.addData(_personModal);
                },
                child: Text("添加一条数据")
            ),
            ListDemo()
          ],
        ),
      ),
    );
  }

}

class ListDemo extends StatelessWidget {

  List<Widget> getItemView(List<PersonModel> items,PersonBloc personBloc) {

    if (items.length == 0) return [];

    List<Widget> itemViews = [];

    for (int i = 0 ; i < items.length ; i++) {
      PersonModel personModel = items[i];
      Widget widget = ListTile(
        leading: IconButton(
            icon: Icon(Icons.highlight_off),
            onPressed: (){
              personBloc.changeData(true, i);
            }
        ),
        title: Text(personModel.name),
        subtitle: Text(personModel.desc),
        trailing: IconButton(
          icon: Text(personModel.age.toString()),
          onPressed: () {
            personBloc.changeData(false, i);
          },
        ),
      );

      itemViews.add(widget);
    }

    return itemViews;

  }

  @override
  Widget build(BuildContext context) {
    PersonBloc personBloc = BlocProvider.of(context);

    return StreamBuilder<List<PersonModel>>(
      stream: personBloc.itemsStream,
      initialData: [],
      builder: (context,snapshot){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: this.getItemView(snapshot.data,personBloc),
        );
      }
    );
  }

}

class PersonModel {
  String name;
  String desc;
  int age;

  PersonModel({@required this.name,@required this.desc,@required this.age});

}


class PersonBloc {

  final List<PersonModel> _items = [];

  final _itemController = BehaviorSubject<List<PersonModel>>();

  ValueObservable<List<PersonModel>> get itemsStream => _itemController.stream;

  addData(PersonModel personModal) {
    _items.add(personModal);
    _itemController.add(_items);
  }

  dispose() {
    _itemController.close();
  }

  changeData(bool isReset , int position) {
    if (position < _items.length && position >= 0) {
      if (isReset) {
        _items[position].age = 0;
      } else {
        _items[position].age = _items[position].age + 1;
      }
    }
    _itemController.add(_items);
  }

}

// ignore: must_be_immutable
class BlocProvider extends InheritedWidget {

  final PersonBloc bloc;

  BlocProvider({Key key,@required Widget child, @required PersonBloc bloc}) :
        bloc = bloc ?? PersonBloc(),
        super(key: key,child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static PersonBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bloc;

}
