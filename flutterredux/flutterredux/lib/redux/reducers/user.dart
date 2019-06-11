import 'package:flutterredux/redux/action/find_action.dart';
import 'package:flutterredux/redux/state/user_tree.dart';

UserTree userTree(UserTree state,action){
  switch(action.type) {
    case EFindType.search:
      return state;
  }
  return state;
}