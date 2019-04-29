import 'package:flutter/material.dart';

class TabMainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TabMainPageState();
  }
}

class TabMainPageState extends State<TabMainPageWidget> {

  int _tabIndex = 0;

  var _tabItemIcons;
  var _tabItemTexts;
  var _tabItemPages;

  Text getTabTextView(int curIndex) {
    MaterialColor color = Colors.grey;
    if(curIndex == _tabIndex) color = Colors.lightBlue;
    return new Text(
        _tabItemTexts[curIndex],
        style: TextStyle(color: color)
    );
  }

  Icon getTabIconView(int curIndex) {
    MaterialColor color = Colors.grey;
    if(curIndex == _tabIndex)  color = Colors.lightBlue;
    return Icon(_tabItemIcons[curIndex],color: color);
  }

  void initData() {
    _tabItemTexts = [
      "首页",
      "新闻",
      "我的"
    ];

    _tabItemIcons = [
      Icons.home,
      Icons.search,
      Icons.perm_identity
    ];

    _tabItemPages = [
      new Tab1Page(),
      new Tab2Page(),
      new Tab3Page()
    ];
  }

  @override
  Widget build(BuildContext context) {

    initData();

    return new Scaffold(
      body: _tabItemPages[_tabIndex],
      bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: getTabIconView(0),
              title: getTabTextView(0)
            ),
            BottomNavigationBarItem(
                icon: getTabIconView(1),
                title: getTabTextView(1)
            ),
            BottomNavigationBarItem(
                icon: getTabIconView(2),
                title: getTabTextView(2)
            )
          ],
          type: BottomNavigationBarType.fixed,
          iconSize: 24,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
      ),
      endDrawer: MyDrawer(),
    );
  }

}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrangeAccent,
      width: 240,
      child: new Column(
        children: <Widget>[
          AppBar(
            title: Text("欢迎，欢迎"),
            automaticallyImplyLeading: false,
          ),
          new Text("欢迎，欢迎")
        ],
      ),
    );
  }
}

class Tab1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            color: Colors.white,
            icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context)
        ),
        title: new Text("首页"),
      ),
      body: new Center(
        child: new Text("首页哦"),
      ),
    );
  }

}

class Tab2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,

        child: new Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: new Text("新闻"),
            elevation: 0,
            bottom: TabBar(
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.ac_unit)),
                  Tab(icon: Icon(Icons.access_alarm)),
                  Tab(icon: Icon(Icons.accessibility)),
                  Tab(icon: Icon(Icons.adb)),
                  Tab(icon: Icon(Icons.keyboard)),
                  Tab(icon: Icon(Icons.mail)),
                ],
                indicatorColor: Colors.deepOrangeAccent,
                unselectedLabelColor: Colors.white,
                labelColor: Colors.deepOrangeAccent,
                indicatorSize: TabBarIndicatorSize.label,
            ),
          ),
          body: new TabBarView(
              children: <Widget>[
                Icon(Icons.ac_unit,color: Colors.deepOrangeAccent,size: 64),
                Icon(Icons.access_alarm,color: Colors.deepOrangeAccent,size: 64),
                Icon(Icons.accessibility,color: Colors.deepOrangeAccent,size: 64),
                Icon(Icons.adb,color: Colors.deepOrangeAccent,size: 64),
                Icon(Icons.keyboard,color: Colors.deepOrangeAccent,size: 64),
                Icon(Icons.mail,color: Colors.deepOrangeAccent,size: 64),
              ]
          ),
        ),
    );
  }

}

class Tab3Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: new Text("我的"),
      ),
      body: new Center(
        child: new Text("我的"),
      ),
    );
  }

}



