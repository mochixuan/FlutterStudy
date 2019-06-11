import 'package:flutterredux/redux/state/find_tree.dart';
import 'package:flutterredux/redux/state/user_tree.dart';
import 'package:flutterredux/data/const/constant.dart';


class GlobalTree {

  FindTree findTree;
  UserTree userTree;

  GlobalTree.initState() {
    findTree = FindTree([]);
    userTree = UserTree(Constant.ThemeItems[0]['color']);
  }

}