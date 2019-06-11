import 'package:flutterredux/redux/state/find_tree.dart';
import 'package:flutterredux/redux/action/find_action.dart';

FindTree findReducer(FindTree state,action){
  switch(action.type) {
    case EFindType.search:
      if (!state.historyItems.contains(action.data)) {
        state.historyItems.add(action.data);
      }
      return state;
    case EFindType.delete:
      state.historyItems.remove(action.data);
      return state;
  }
  return state;
}