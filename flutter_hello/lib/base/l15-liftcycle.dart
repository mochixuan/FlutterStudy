import 'package:flutter/material.dart';

class LiftCycle extends StatefulWidget {

  int test = 0;

  @override
  State<StatefulWidget> createState() {
    return LiftCycleState();
  }
}

class LiftCycleState extends State<LiftCycle> {

  int test = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: Colors.white,
            icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context)
        ),
        title: Text("生命周期"),
      ),
      body: WBoxProvider(
          age: 1,
          child: Column(
            children: <Widget>[
              OutlineButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("调加"),
              ),
              LiftCycle1()
            ],
          )
      )
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("第一个的： didChangeDependencies");
  }

}


class LiftCycle1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LiftCycleState1();
  }
}

class LiftCycleState1 extends State<LiftCycle1> with WidgetsBindingObserver{

  int count = 0;

  LiftCycleState1(){
    // 构造函数
    debugPrint("constructor");
  }

  @override
  void initState() {
    super.initState();
    debugPrint("initState");
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("didChangeDependencies");
  }

  @override
  void reassemble() {
    super.reassemble(); //重组
    // 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
  }

  @override
  void didUpdateWidget(LiftCycle1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("didUpdateWidget"); //当树rebuid的时候会调用该方法
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint(state.toString());
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("dispose");
  }

  @override
  Widget build(BuildContext context) {

    debugPrint("build");

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("count总数: "+count.toString()),
          OutlineButton(
              child: Text("单机Count"),
              onPressed: (){
                setState(() {
                  count = ++count;
                });
              }
          ),
          Text("age总数: "+WBoxProvider.of(context).age.toString()),
          OutlineButton(
              child: Text("单机Age"),
              onPressed: (){
                setState(() {
                  WBoxProvider.of(context).addAge();
                });
              }
          )
        ],
      ),
    );
  }
}

class WBoxProvider extends InheritedWidget {

  int age;
  final Widget child;

  WBoxProvider({
    @required this.age,
    @required this.child}) : super(child: child);

  addAge() {
    this.age = ++this.age;
  }

  static WBoxProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(WBoxProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

}