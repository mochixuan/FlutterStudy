import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterredux/redux/action/find_action.dart';
import 'package:flutterredux/redux/state/index.dart';
import 'package:flutterredux/redux/state/find_tree.dart';
import 'package:flutterredux/utils/util.dart';

class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FindState();
  }
}

class FindState extends State<FindPage> with AutomaticKeepAliveClientMixin{

  TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          centerTitle: true,
          title: Container(
            height: 40,
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                hintText: "请输入内容",
                hintStyle: TextStyle(fontSize: 16,color: Color(0xffe0e0e0)),
                contentPadding: const EdgeInsets.symmetric(vertical: 9,horizontal: 20),
                suffixIcon: StoreConnector<GlobalTree,Function(dynamic action)>(
                    builder: (context,callBack){
                      return IconButton(
                          onPressed: (){
                            String input = _controller.value.text;
                            if (input.length > 0) {
                              callBack(searchAction(input));
                              _controller.text = '';
                            } else {
                              Util.showToast(context, "请输入内容");
                            }
                          },
                          icon: Icon(Icons.search)
                      );
                    },
                    converter: (store) => store.dispatch,
                    rebuildOnChange: false, //不需要刷新
                )
              ),
              maxLines: 1,
              style: TextStyle(fontSize: 16,color: Theme.of(context).primaryColor),
            ),
          ),
        ),
        StoreConnector<GlobalTree,FindTree>(
          converter: (store) => store.state.findTree,
          builder: (context,findTree) {
            return SliverFixedExtentList(
              itemExtent: 54,
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(0xffe0e0e0)))
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(findTree.historyItems[index],style: TextStyle(fontSize: 18,color: Colors.black),),
                                StoreConnector<GlobalTree,Function(dynamic action)>(
                                  builder: (context,callback){
                                    return IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: (){
                                          callback(deleteAction(findTree.historyItems[index]));
                                        },
                                        splashColor: Color(0xffe0e0e0)
                                    );
                                  },
                                  converter: (store) => store.dispatch,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: findTree.historyItems.length,
              ),
            );
          },
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}