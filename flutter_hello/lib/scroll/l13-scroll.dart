import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// flutter_staggered_grid_view 三方包

// SingleChildScrollView类似于Android中的ScrollView，它只能接收一个子Widget
// primary：指是否使用widget树中默认的PrimaryScrollController
// *** 通常SingleChildScrollView只应在期望内容适合屏幕的情况下使用，它无法使用基于Sliver的延迟实例化，如果预计视口通常包含超出屏幕尺寸的内容，那么SingleChildScrollView将会非常昂贵

// itemExtent: 指定主轴长度，优化作用
// shrinkWrap： 当ListView在一个无边界(滚动方向上)的容器中时，shrinkWrap必须为true
// addAutomaticKeepAlives: 保活
// addRepaintBoundaries： 该属性表示是否将列表项（子widget）包裹在RepaintBoundary中。当可滚动widget滚动时，将列表项包裹在RepaintBoundary中可以避免列表项重绘，但是当列表项重绘的开销非常小（如一个颜色块，或者一个较短的文本）时，不添加RepaintBoundary反而会更高效。和addAutomaticKeepAlive一样，如果列表项自己维护其KeepAlive状态，那么此参数必须置为false
// itemCount：列表项的数量，如果为null，则为无限列表

class ScrollLearn extends StatelessWidget {

  final itemCount = 20;

  getItemViews() {
    List<Widget> views = [];
    for (var i = 0 ; i < itemCount ; i++) {
      views.add(
        Container(
          height: 40,
          child: ListTile(
            leading: Chip(
                label: Text((i+1).toString(),style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                )
                ),
                backgroundColor: Colors.lightBlue
            ),
            title: Text('我是第${i+1}条数据'),
          ),
        )
      );
    }
    return views.toList();
  }
  
  @override
  Widget build(BuildContext context) {

    if (1 == 1) {
      return CustomScrollViewLearn();
    }

    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            color: Colors.white,
            icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context)
        ),
        title: new Text("Scroll"),
      ),
// 1. SingleChildScrollView
//      body: Scrollbar(
//          // 它只能接收一个子Widget
//          child: SingleChildScrollView(
//            padding: const EdgeInsets.all(0),
//            // scrollDirection: Axis.vertical,
//            //reverse: false,
//            child: Column(
//              children: this.getItemViews(),
//            ),
//          )
//      ),
// 2. ListView
//        body: ListView(
//          children: this.getItemViews(),
//        ),
    // 适合列表项比较多（或者无限）的情况,因为只有当子Widget真正显示的时候才会被创建
//    body: ListView.builder(
//        itemCount: itemCount,
//        itemExtent: 60, // 强制高度
//        itemBuilder: (BuildContext context,int index) {
//          return Container(
//            height: 60,
//            child: ListTile(
//              leading: Chip(
//                  label: Text((index+1).toString(),style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 14
//                  )
//                  ),
//                  backgroundColor: Colors.lightBlue
//              ),
//              title: Text('我是第${index+1}条数据'),
//            ),
//          );
//        }
//      ),
// ListView.separated : 它除了比ListView.builder多了一个separatorBuilder参数，该参数是一个分割器生成器
//      body: ListView.separated(
//        itemCount: itemCount,
//        separatorBuilder: (BuildContext context, int index){
//          if (index%2 == 0) {
//            return Divider(height: 2,color: Colors.deepOrange);
//          } else {
//            return Divider(height: 2,color: Colors.blueAccent);
//          }
//        },
//        itemBuilder: (BuildContext context,int index) {
//          return Container(
//            child: ListTile(
//              leading: Chip(
//                  label: Text((index+1).toString(),style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 14
//                  )
//                  ),
//                  backgroundColor: Colors.lightBlue
//              ),
//              title: Text('我是第${index+1}条数据'),
//            ),
//          );
//        }
//      ),
    //body: InfiniteListView(),

      // GridView
      body: GridViewLearn(),
    );
  }

}

// 实现无限加载列表的功能
class InfiniteListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InfiniteListViewState();
  }
}

class _InfiniteListViewState extends State<InfiniteListView> {

  final WordPair _loadWordPair = WordPair("Wang", "Xuan");
  final _wordItems = <WordPair>[];
  bool _isRequesting = false;

  @override
  void initState() {
    super.initState();
    _wordItems.add(_loadWordPair);
    _requestData();
  }

  void _requestData() {

    //防止重复请求
    if (_isRequesting) return;
    this._isRequesting = true;

    debugPrint("当前数据大小: ${_wordItems.length}");

    Future.delayed(Duration(seconds: 3))
          .then((e){
            this._isRequesting = false;
            setState(() {
              _wordItems.insertAll(
                  _wordItems.length - 1,
                  generateWordPairs().take(10)
              );
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: _wordItems.length,
        separatorBuilder: (BuildContext context, int index){
          if (index%2 == 0) {
            return Divider(height: 2,color: Colors.deepOrange);
          } else {
            return Divider(height: 2,color: Colors.blueAccent);
          }
        },
        itemBuilder: (BuildContext context,int index) {
          if (_wordItems[index].asPascalCase == "WangXuan") {
            if (_wordItems.length < 30) {
              _requestData();
              return Container(
                height: 48,
                child: Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                height: 48,
                alignment: Alignment.center,
                child: Text("没有跟多了，亲！！"),
              );
            }
          }
          return Container(
            child: ListTile(
              leading: Chip(
                  label: Text((index+1).toString(),style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                  )
                  ),
                  backgroundColor: Colors.lightBlue
              ),
              title: Text(_wordItems[index].asPascalCase),
            ),
          );
        }
      );
  }

}

// GridView
class GridViewLearn extends StatelessWidget {

  final iconItems = <IconData>[
    Icons.ac_unit,
    Icons.airport_shuttle,
    Icons.all_inclusive,
    Icons.beach_access,
    Icons.cake,
    Icons.free_breakfast
  ];

  getItemViews() {
    List<Widget> views = [];
    for (var i = 0 ; i < 20 ; i++) {
      views.add(
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.green
            ),
            child: Chip(
                label: Text((i+1).toString(),style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  )
                ),
                backgroundColor: Colors.white
            ),
          )
      );
    }
    return views.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
//      child: GridView(
//        // 横轴为固定数量子元素
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          crossAxisCount: 4,
//          mainAxisSpacing: 4,
//          crossAxisSpacing: 4,
//          childAspectRatio: 3/4
//        ),
//        children: getItemViews(),
//      ),
    // GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount
//      child: GridView.count(
//        crossAxisCount: 4,
//        mainAxisSpacing: 4,
//        crossAxisSpacing: 4,
//        childAspectRatio: 3/4,
//        children: getItemViews(),
//      ),

//     child: GridView(
//        // 横轴为固定数量子元素
//        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//          maxCrossAxisExtent: 40,
//          mainAxisSpacing: 4,
//          crossAxisSpacing: 4,
//          childAspectRatio: 1/2
//        ),
//        children: getItemViews(),
//      ),

      // GridView.extent : GridView.extent构造函数内部使用了SliverGridDelegateWithMaxCrossAxisExtent
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0
          ),
          itemCount: iconItems.length,
          itemBuilder: (context,index) {
            return Icon(iconItems[index]);
          }
      ),

    );
  }

}

class CustomScrollViewLearn extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            //snap: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("旋"),
              background: Image.network(
                "http://n.sinaimg.cn/photo/transform/700/w1000h500/20190507/cb37-hwsffza5403856.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(4),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index){
                      return Container(
                        height: 40,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(10),
                        color: Colors.lightBlue[100*(index%10)],
                        child: Text("第${index+1}个",style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold),),
                      );
                    },
                    childCount: 10
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    childAspectRatio: 4/1,
                    crossAxisSpacing: 4
                )
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  color: Colors.lightBlue[100*(index%10)],
                  child: Text("第${index+1}个",style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold),),
                );
              },
              childCount: 20
            ),
          )
        ],
      ),
    );
  }
  
}
