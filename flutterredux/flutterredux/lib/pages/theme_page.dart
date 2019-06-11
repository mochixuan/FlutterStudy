import 'package:flutter/material.dart';
import 'package:flutterredux/data/const/constant.dart';

class ThemePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThemeState();
  }
}

class ThemeState extends State<ThemePage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{

  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    final int itemLength =  Constant.ThemeItems.length;

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: itemLength*300),
    );
    _animation = Tween(begin: 0.0,end: itemLength.toDouble())
        .animate(_animationController)
      ..addListener((){
        setState(() {});
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // 间隙
    const _gridSpacing = 8.0;

    return Scaffold(
      appBar: AppBar(
        title: Text("主题"),
      ),
      body: Container(
        padding: const EdgeInsets.all(_gridSpacing),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 5/6,
              crossAxisSpacing: _gridSpacing,
              mainAxisSpacing: _gridSpacing,
              crossAxisCount: 3,
            ),
            itemCount: Constant.ThemeItems.length,
            itemBuilder: (context,index) {

              final _themeModel = Constant.ThemeItems[index];

              final animateValue = _getScaleValue(index);

              return Opacity(
                opacity: animateValue,
                child: Transform.scale(
                  scale: animateValue,
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {

                    },
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(_themeModel['color']),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.elliptical(4, 4),
                                    topRight: Radius.elliptical(4, 4)
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text(
                            _themeModel['name'],
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Color(_themeModel['color']),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }

  double _getScaleValue(int index) {
    double value = _animation.value;
    if (value > index && value < index + 1) {
      return value - index;
    } else if (value >= index + 1) {
      return 1.0;
    }
    return 0.0;
  }

  @override
  bool get wantKeepAlive => true;

}