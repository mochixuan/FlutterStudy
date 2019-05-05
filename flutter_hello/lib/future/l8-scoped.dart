import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new ScopedModel(
        model: PersonModel(),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                color: Colors.white,
                icon:Icon(Icons.arrow_back),
                onPressed:() => Navigator.pop(context)
            ),
            title: new Text("ScopedModel"),
          ),
          body: new Container(
            child: new Column(
              children: <Widget>[
                Card(
                  child: ScopedModelDescendant<PersonModel>(
                      builder: (context,_,model) => ListTile(
                          leading: Icon(Icons.accessibility),
                          title: Text(model.name),
                          subtitle: Text(model.desc),
                          trailing: IconButton(
                              icon: Text(model.age.toString()), 
                              onPressed: () {
                                model.increaseAge();
                                // 第二中方式： rebuildOnChange属性默认为false，所以会导致无法刷新（同步）状态的情况发生，需要手动指定rebuildOnChange：true
                                // final twoMethod = ScopedModel.of<PersonModel>(context);
                                // twoMethod.increaseAge();
                              }
                          )
                      )
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }

}

class PersonModel extends Model {

  String name = "mochixuan";
  String desc = "Android、React Native、React、Flutter、Web";
  int age = 0;

  increaseAge() {
    this.age = ++this.age;
    notifyListeners();
  }
}
