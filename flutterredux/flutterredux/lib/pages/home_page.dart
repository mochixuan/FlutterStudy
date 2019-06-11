import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterredux/redux/state/index.dart';
import 'package:flutterredux/redux/state/user_tree.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  List<ListTile> _listViews;

  HomeState() {
    _listViews = [];
    for(int i = 0 ; i < 20 ; i++) {
      String words = WordPair.random().asPascalCase;
      _listViews.add(ListTile(
        leading: CircleAvatar(
          child: Text(words.substring(0,1)),
        ),
        title: Text(words),
        subtitle: Text("age:"+Random().nextInt(40).toString()),
        onTap: (){

        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: <Widget>[
        StoreConnector<GlobalTree,UserTree>(
          builder: (context,userTree){
            return SliverAppBar(
              title: Text("Home"),
              pinned: true,
              backgroundColor: Color(userTree.themeColor),
            );
          },
          converter: (store) => store.state.userTree
        ),
        SliverList(
            delegate: SliverChildListDelegate(
              _listViews,
            ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

}