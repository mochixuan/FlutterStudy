import 'package:flutterredux/redux/action/find_action.dart';
import 'package:flutterredux/redux/state/index.dart';
import 'package:flutterredux/redux/reducers/find.dart';

GlobalTree reducers(GlobalTree state,action) {
  switch (action.type.runtimeType) {
    case EFindType:
      findReducer(state.findTree, action);
      break;
  }
  return state;
}