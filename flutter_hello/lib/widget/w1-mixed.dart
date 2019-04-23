import 'package:flutter/material.dart';

class W1Mixed extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _controller = TextEditingController();

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
              color: Colors.white,
              icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.pop(context)
          ),
          title: new Text("杂七杂八"),
        ),
        body: new Column(
          children: <Widget>[
            new Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.red,
                gradient: LinearGradient(colors: [
                  Colors.red,Colors.yellow
                ])
              ),
//              foregroundDecoration: BoxDecoration(
//                  image: DecorationImage(
//                      fit: BoxFit.cover,
//                      image: NetworkImage("https://ss3.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=d4f701b004d162d99aee641c21dea950/b7003af33a87e950e3d5bc181e385343faf2b480.jpg")
//                  )
//              ),
              child: new Text(
                  "Xuan",
                  //textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            new Row(
              //mainAxisSize: MainAxisSize.min,
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              verticalDirection: VerticalDirection.up,
              crossAxisAlignment: CrossAxisAlignment.center,
              textBaseline: TextBaseline.ideographic,
              children: <Widget>[
                new Container(
                  width: 40,
                  height: 40,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: new Text(
                    "1F天",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
                ),
                new Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  color: Colors.amber,
                  child: new Text(
                    "2",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
                new Container(
                  width: 40,
                  height: 40,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: new Text(
                    "3",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Image(
                  image: NetworkImage("https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2146046871,2611785107&fm=27&gp=0.jpg"),
                  width: 48,
                  height: 48,
                ),
                new Image(
                  image: AssetImage("lib/image/icon1.png"),
                  width: 48,
                  height: 48,
                ),
                new Image.network(
                    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2146046871,2611785107&fm=27&gp=0.jpg",
                  width: 48,
                  height: 48,
                  fit: BoxFit.fill
                ),
                new ClipRRect(
                  child: Image.network(
                      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2146046871,2611785107&fm=27&gp=0.jpg",
                      width: 48,
                      height: 48,
                      fit: BoxFit.fill
                  ),
                  borderRadius: BorderRadius.circular(6),
                )
              ],
            ),
            new Container(
              width: 200,
              alignment: Alignment.topLeft,
              color: Colors.amber,
              child: new Column(
                children: <Widget>[
                  new Text(
                    "床前明月光，疑是地上霜。举头望明月，低头思故乡",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text.rich(TextSpan(
                    text: 'hello',
                    children: [
                      TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
                      TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
                    ]
                  ))
                ],
              ),
            ),
            new Row(
              children: <Widget>[
                new Icon(
                  Icons.accessibility,
                  color: Colors.blue,
                  size: 30,
                ),
                new RaisedButton(
                    onPressed: (){

                    },
                  textColor: Colors.blue,
                  child: new Text("大家好"),
                ),
                new FlatButton(
                    onPressed: (){},
                    color: Colors.blue,
                    child: new Text("大家好")
                ),
                new FloatingActionButton(
                  onPressed: (){},
                  foregroundColor: Colors.amber,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.ac_unit,color: Colors.white,),
                )
              ],

            ),
            new Column(
              children: <Widget>[
                new TextField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    hintText: "请输入文本内容！",
                    prefixIcon: Icon(Icons.access_alarms),
                    labelText: "LabelText",
                    labelStyle: TextStyle(
                      color: Colors.deepPurpleAccent
                    ),
                    errorText: "errorText",
                    errorStyle: TextStyle(
                      color: Colors.red
                    ),
                    fillColor: Colors.amber,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.cyan,
                        width: 100,
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  style: new TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                  cursorColor: Colors.blue,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}