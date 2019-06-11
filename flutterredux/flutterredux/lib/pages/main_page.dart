import 'package:flutter/material.dart';
import 'package:flutterredux/pages/home_page.dart';
import 'package:flutterredux/pages/find_page.dart';
import 'package:flutterredux/pages/theme_page.dart';
import 'package:flutterredux/pages/user_page.dart';
import 'package:flutterredux/utils/ui_util.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<MainPage> with AutomaticKeepAliveClientMixin{

  List<Widget> _tabBarViews;
  List<Widget> _tabWidgets;

  @override
  void initState() {
    super.initState();

    _tabWidgets = [
      HomePage(),
      FindPage(),
      ThemePage(),
      UserPage()
    ];

    _tabBarViews = [
      Tab(text: "Home",icon: Icon(Icons.home),),
      Tab(text: "Find",icon: Icon(Icons.find_replace),),
      Tab(text: "Theme",icon: Icon(Icons.color_lens),),
      Tab(text: "User",icon: Icon(Icons.perm_identity),),
    ];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
      home: DefaultTabController(
          length: _tabWidgets.length,
          child: Builder(builder: (context){
            return Container(
              color: Colors.white,
              padding: EdgeInsets.only(bottom: UiUtils.getSafeBottomHeight(context)),
              child: Scaffold(
                backgroundColor: Colors.white,
                body: TabBarView(
                  children: _tabWidgets,
                ),
                bottomNavigationBar: TabBar(
                  tabs: _tabBarViews,
                  labelColor: Color(0xff1abc9c),
                  unselectedLabelColor: Color(0xff000000),
                  indicatorColor: Colors.white,
                  labelPadding: const EdgeInsets.all(0),
                  indicatorPadding: const EdgeInsets.all(0),
                ),
              ),
            );
          })
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}