import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FutureState();
  }
}

class FutureState extends State<FuturePage> {

  Color _themeColor = Colors.lightBlue;

  void _changeTheme(themeColor) {
    setState(() {
      this._themeColor = themeColor;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            color: Colors.white,
            icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context)
        ),
        title: new Text("流的学习"),
      ),
      body: new Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(8),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new WBox(this._themeColor,_changeTheme),
            new WBoxProvider(
                themeColor: _themeColor,
                changeTheme: _changeTheme,
                child: WBox1()
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: new Icon(Icons.ac_unit,color: Colors.deepPurpleAccent,),
                  onPressed: () {
                    _changeTheme(Colors.deepPurpleAccent);
                  },
                ),
                IconButton(
                    icon: new Icon(Icons.ac_unit,color: Colors.deepOrangeAccent,),
                    onPressed: () {
                      _changeTheme(Colors.deepOrangeAccent);
                    }
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WBox extends StatelessWidget {

  final Color themeColor;
  final changeTheme;

  WBox(this.themeColor,this.changeTheme);

  @override
  Widget build(BuildContext context) {

    return new FlatButton(
        padding: EdgeInsets.all(0),
        highlightColor: Colors.white,
        splashColor: Colors.white,
        onPressed: () {
          changeTheme(Colors.lightBlue);
        },
        child: Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: this.themeColor,
          ),
          child: new Center(
            child: new Text(
              "主题色",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
              ),
            ),
          ),
        )
    );
  }
}

class WBoxProvider extends InheritedWidget {

  final Color themeColor;
  final changeTheme;
  final Widget child;

  WBoxProvider({
    @required this.themeColor,
    @required this.changeTheme,
    @required this.child}) : super(child: child);

  static WBoxProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(WBoxProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

}

class WBox1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new FlatButton(
        padding: EdgeInsets.all(0),
        highlightColor: Colors.white,
        splashColor: Colors.white,
        onPressed: () {
          WBoxProvider.of(context).changeTheme(Colors.lightBlue);
        },
        child: Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: WBoxProvider.of(context).themeColor,
          ),
          child: new Center(
            child: new Text(
              "Inherited",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
              ),
            ),
          ),
        )
    );
  }
}