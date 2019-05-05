import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';


class ReduxLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Store<PersonState>(reducer,initialState: PersonState.initState());
    return _ReduxApp(store);
  }
}

class _ReduxApp extends StatelessWidget {

  final Store<PersonState> store;

  _ReduxApp(this.store);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<PersonState>(
        store: store,
        child: new Scaffold(
          appBar: AppBar(
            leading: IconButton(
                color: Colors.white,
                icon:Icon(Icons.arrow_back),
                onPressed:() => Navigator.pop(context)
            ),
            title: new Text("Redux Lean"),
          ),
          body: new PersonItem(),
        )
    );
  }
}

class PersonItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<PersonState,PersonState>(
      converter: (store) => store.state,
      builder: (context,personState){
        return ListTile(
            leading: Icon(Icons.accessibility),
            title: Text(personState.name),
            subtitle: Text(personState.desc),
            trailing: StoreConnector<PersonState,VoidCallback>(
                builder: (context,callback){
                  return IconButton(
                      icon: Text(personState.age.toString()),
                      onPressed: callback
                  );
                },
                converter: (store) {
                  final action = ActionType(type: INCREASE_ACTION,data: ++store.state.age);
                  return () => store.dispatch(action);
                }
            )
        );
      },
    );
  }
}

// State
@immutable
class PersonState {
  String name = "mochixuan";
  String desc = "Android、React Native、React、Flutter、Web";
  int age = -1;

  PersonState({
    @required this.age
  });

  PersonState.initState() {
    age = 0;
  }

}

class ActionType {
  String type;
  var data;

  ActionType({@required this.type, this.data});

}

const INCREASE_ACTION = 'INCREASE_ACTION';

// reducer
PersonState reducer(PersonState state,action) {
  if(action.type == INCREASE_ACTION) {
    PersonState newState = new PersonState(age: action.data);
    return newState;
  }
  return state;
}