import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:flutterredux/pages/main_page.dart';
import 'package:flutterredux/redux/reducers/index.dart';
import 'package:flutterredux/redux/state/index.dart';

void main(){
  
  final Store<GlobalTree> _store = Store<GlobalTree>(
      reducers,
      initialState: GlobalTree.initState()
  );

  final rootPage = StoreProvider<GlobalTree>(
    store: _store,
    child: MainPage(),
  );

  return runApp(rootPage);
}