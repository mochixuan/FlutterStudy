import 'package:flutter/material.dart';

import 'package:flutter_hello/base/l1-first-list.dart'; // 1. 第一个官方Demo

import 'package:flutter_hello/base/l2-widget.dart'; //2. Widget 框架总览
import 'package:flutter_hello/base/l3-widget.dart'; //3. Widget 框架总览
import 'package:flutter_hello/base/l4-widget.dart'; //4. Widget 框架总览
import 'package:flutter_hello/base/l5-widget.dart'; //5. Widget 框架总览
import 'package:flutter_hello/base/l6-widget.dart';
import 'package:flutter_hello/base/l15-liftcycle.dart'; //生命周期

import 'package:flutter_hello/widget/w1-mixed.dart';

import 'package:flutter_hello/pages/TabBarPage.dart';

import 'package:flutter_hello/future/l7-state.dart';
import 'package:flutter_hello/future/l8-scoped.dart';
import 'package:flutter_hello/future/l9-stream.dart';
import 'package:flutter_hello/future/l10-rxdart.dart';
import 'package:flutter_hello/future/l11-bloc.dart';
import 'package:flutter_hello/future/l12-redux.dart';
import 'package:flutter_hello/future/l14-bloc1.dart';

import 'package:flutter_hello/scroll/l13-scroll.dart';
import 'package:flutter_hello/anim/l16-anim.dart';

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
    routeItems.add(new RouteBean(routeKey: '/l8',routeWidget: (BuildContext context) => ScopedLearn(),routeTag:'ScopedModel'));
    routeItems.add(new RouteBean(routeKey: '/l9',routeWidget: (BuildContext context) => StreamLearn(),routeTag:'Stream学习'));
    routeItems.add(new RouteBean(routeKey: '/l10',routeWidget: (BuildContext context) => RxDartLearn(),routeTag:'RxDart学习'));
    routeItems.add(new RouteBean(routeKey: '/l11',routeWidget: (BuildContext context) => BlocLearn(),routeTag:'Bloc学习'));
    routeItems.add(new RouteBean(routeKey: '/l12',routeWidget: (BuildContext context) => ReduxLearn(),routeTag:'Redux学习'));

    routeItems.add(new RouteBean(routeKey: '/l13',routeWidget: (BuildContext context) => ScrollLearn(),routeTag:'ScrollView'));
    routeItems.add(new RouteBean(routeKey: '/l14',routeWidget: (BuildContext context) => BlocLearn1(),routeTag:'Bloc1'));
    routeItems.add(new RouteBean(routeKey: '/l15',routeWidget: (BuildContext context) => LiftCycle(),routeTag:'生命周期'));
    routeItems.add(new RouteBean(routeKey: '/l16',routeWidget: (BuildContext context) => AnimateLearn(),routeTag:'动画'));

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