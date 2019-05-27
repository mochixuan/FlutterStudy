import 'package:flutter/material.dart';

class AnimateLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: Colors.white,
            icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context)
        ),
        title: Text("Animate"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TweenWidget(),
            CurvedWidget(),
            AnimateBuilderWidget(),
            RouteAnimateWidget(),
            HeroWidget(),
            StaggerWidget()
          ],
        ),
      ),
    );
  }
}

class HeroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return FlatButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
                tag: "name",
                child: Text("Mo Chi Xuan",style: TextStyle(color: Colors.deepPurpleAccent),)
            ),
            Hero(
                tag: "avatar",
                child: ClipOval(
                  child: Image.network(
                    "http://n.sinaimg.cn/news/1_img/upload/cf3881ab/65/w1000h665/20190522/1ca3-hxhyiun3638805.jpg",
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill,
                  ),
                )
            ),

          ],
        ),
        onPressed: (){
          Navigator.push(context, PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 1000),
              pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                return FadeTransition(
                    opacity: animation,
                    child: Scaffold(
                      appBar: AppBar(
                        leading: IconButton(
                            color: Colors.white,
                            icon:Icon(Icons.arrow_back),
                            onPressed:() => Navigator.pop(context)
                        ),
                        title: Hero(
                            tag: "name",
                            child: Text("Mo Chi Xuan",style: TextStyle(color: Colors.deepPurpleAccent),)
                        ),
                      ),
                      body: Hero(
                          tag: "avatar",
                          child: Image.network(
                            "http://n.sinaimg.cn/news/1_img/upload/cf3881ab/65/w1000h665/20190522/1ca3-hxhyiun3638805.jpg",
                            height: 300,
                            fit: BoxFit.fill,
                          )
                      ),
                    ),
                );
              }
          ));
        },
    );
  }
}

class RouteAnimateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text("过渡动画"),
      onPressed: (){
        Navigator.push(context, PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 300),
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
              return ScaleTransition(
                scale: animation,
                child: Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                        color: Colors.white,
                        icon:Icon(Icons.arrow_back),
                        onPressed:() => Navigator.pop(context)
                    ),
                    title: Text("Animate"),
                  ),
                  backgroundColor: Colors.black,
                  body: Center(child: Text("大家好"),),
                ),
              );
            }
        ));
      },
    );
  }

}

class TweenWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TweenState();
  }
}
class TweenState extends State<TweenWidget> with SingleTickerProviderStateMixin{

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 2));
    Tween<double>(begin: 0,end: 1)
        .animate(_animationController)
        .addListener((){
          setState(() {});
        });
  }

  @override
  void dispose() {
    _animationController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.highlight,color: Colors.deepOrange,size: 40,),
            onPressed: () {
              _animationController.forward();
            }
        ),
        ClipOval(
          child: Container(
            width: _animationController.value*100,
            height: _animationController.value*100,
            color: Colors.lightBlue,
            alignment: Alignment.center,
            child: Text("旋",style: TextStyle(color: Colors.white,fontSize: 20),),
          ),
        )
      ],
    );
  }
}

class CurvedWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CurvedState();
  }
}
class CurvedState extends State<CurvedWidget> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 2));
    _animation =  CurvedAnimation(parent: _animationController, curve: Curves.bounceIn);
    _animation.addListener((){
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.highlight,color: Colors.deepOrange,size: 40,),
            onPressed: () {
              _animationController.forward();
            }
        ),
        ClipOval(
          child: Container(
            width: _animationController.value*100,
            height: _animationController.value*100,
            color: Colors.lightBlue,
            alignment: Alignment.center,
            child: Text("旋",style: TextStyle(color: Colors.white,fontSize: 20),),
          ),
        ),
      ],
    );
  }

}

class AnimateBuilderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimateBuilderState();
  }
}
class AnimateBuilderState extends State<AnimateBuilderWidget> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 2));
    _animation =  CurvedAnimation(parent: _animationController, curve: Curves.linear);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("刷新了");
    return Column(
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.highlight,color: Colors.deepOrange,size: 40,),
            onPressed: () {
              _animationController.forward();
            }
        ),
        AnimateView(animation: _animation,),
        AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context,Widget child){
              return ClipOval(
                child: Container(
                  width: _animation.value*100,
                  height: _animation.value*100,
                  color: Colors.lightBlue,
                  alignment: Alignment.center,
                  child: Text("旋",style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
              );
            }
        )
      ],
    );
  }
}

class AnimateView extends AnimatedWidget {

  AnimateView({Key key,Animation<double> animation}) :
      super(key: key,listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return ClipOval(
      child: Container(
        width: animation.value*100,
        height: animation.value*100,
        color: Colors.lightBlue,
        alignment: Alignment.center,
        child: Text("旋",style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
    );
  }
}

class StaggerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StaggerState();
  }
}
class StaggerState extends State<StaggerWidget> with SingleTickerProviderStateMixin{

  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this
    );
    _controller.addListener((){setState(() {

    });});
  }


  Future<Null> _playAnimation() async {
    await _controller.forward();
    return;
    try {
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
      debugPrint("-------TickerCanceled");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _controller.forward();
      },
      child: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            border: Border.all(
              color:  Colors.black.withOpacity(0.5),
            ),
          ),
          //调用我们定义的交错动画Widget
          child: StaggerAnimation(
              controller: _controller
          ),
        ),
      ),
    );
  }

}

// ignore: must_be_immutable
class StaggerAnimation extends StatelessWidget {

  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  StaggerAnimation({Key key,this.controller}) : super(key: key) {

    //高度动画
    height = Tween<double>(
      begin:.0 ,
      end: 300.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.6, //间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );

    color = ColorTween(
      begin:Colors.green ,
      end:Colors.red,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.6,//间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );

    padding = Tween<EdgeInsets>(
      begin:EdgeInsets.only(left: .0),
      end:EdgeInsets.only(left: 100.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.6, 1.0, //间隔，后40%的动画时间
          curve: Curves.ease,
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    debugPrint("刷新");
    return Container(
      alignment: Alignment.bottomCenter,
      padding:padding.value ,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
      ),
    );
  }
}