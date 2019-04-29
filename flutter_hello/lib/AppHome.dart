import 'package:flutter/material.dart';

import 'package:flutter_hello/base/l1-first-list.dart'; // 1. 第一个官方Demo

import 'package:flutter_hello/base/l2-widget.dart'; //2. Widget 框架总览
import 'package:flutter_hello/base/l3-widget.dart'; //3. Widget 框架总览
import 'package:flutter_hello/base/l4-widget.dart'; //4. Widget 框架总览
import 'package:flutter_hello/base/l5-widget.dart'; //5. Widget 框架总览

import 'package:flutter_hello/widget/w1-mixed.dart';

import 'package:flutter_hello/base/l6-widget.dart';

import 'package:flutter_hello/pages/TabBarPage.dart';

import 'package:flutter_hello/future/l7-stream.dart';

class RouteBean {

  RouteBean({this.routeKey,this.routeWidget,this.routeTag});

  final String routeKey;
  final WidgetBuilder routeWidget;
  final String routeTag;
}

class RouteItemView extends StatelessWidget {

  RouteItemView({this.routeBean});

  final RouteBean routeBean;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new ListTile(
          title: new Text(routeBean.routeTag),
          onTap: (){
            Navigator.pushNamed(context, routeBean.routeKey);
          },
        ),
        new Divider(height: 2)
      ],
    );
  }
}

class AppHome extends StatelessWidget {
  
  List<RouteBean> routeItems;
  Map<String, WidgetBuilder> routeWidgetBuilder;

  AppHome() {
    routeItems = List<RouteBean>();
    routeWidgetBuilder = new Map<String, WidgetBuilder>();

    routeItems.add(new RouteBean(routeKey: '/l1',routeWidget: (BuildContext context) => FirstProject1(),routeTag:'第一个项目'));
    routeItems.add(new RouteBean(routeKey: '/l2',routeWidget: (BuildContext context) => LearnWidget2(),routeTag:'Widget 框架总览'));
    routeItems.add(new RouteBean(routeKey: '/l3',routeWidget: (BuildContext context) => LearnWidget3(),routeTag:'Widget 框架总览'));
    routeItems.add(new RouteBean(routeKey: '/l4',routeWidget: (BuildContext context) => LearnWidget4(),routeTag:'Widget 框架总览'));
    routeItems.add(new RouteBean(routeKey: '/l5',routeWidget: (BuildContext context) => LearnWidget5(),routeTag:'Widget 框架总览'));

    routeItems.add(new RouteBean(routeKey: '/w1',routeWidget: (BuildContext context) => W1Mixed(),routeTag:'杂七杂八'));
    routeItems.add(new RouteBean(routeKey: '/a1',routeWidget: (BuildContext context) => AnimatedPage(),routeTag:'动画'));

    routeItems.add(new RouteBean(routeKey: '/b1',routeWidget: (BuildContext context) => TabMainPageWidget(),routeTag:'基本界面'));
    routeItems.add(new RouteBean(routeKey: '/l7',routeWidget: (BuildContext context) => FuturePage(),routeTag:'Future练习'));

    routeItems.forEach((bean){
      routeWidgetBuilder[bean.routeKey] = bean.routeWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter Example"),
        ),
        body: new Container(
          child: new ListView(
            children: routeItems.map<Widget>((item){
              return new RouteItemView(routeBean: item);
            }).toList(),
          )
        ),
      ),
      // initialRoute: routeItems[0].routeKey,
      routes: routeWidgetBuilder,
    );
  }
}