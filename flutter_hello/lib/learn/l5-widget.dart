import 'package:flutter/material.dart';

class Product {
  final String name;
  const Product({this.name});
}
// 类似C语言的typedef功能，可以为已有的类型指定另一个可读性更强的名字。语法格式为：typealias 类型别名 = 已有类型
typedef void CartChangedCallback(Product product,bool isCart);

// Item
class ShoppingListItem extends StatelessWidget {

  ShoppingListItem({Product product, this.inCart, this.onCartChanged}): product = product,super(key: new ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(product,!inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(
          product.name,
          style: _getTextStyle(context)
      ),
    );
  }

}

// 状态
class _ShoppingListState extends State<ShoppingList> {

  Set<Product> _shoppingCart = new Set();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Shopping List"),
      ),
      body: new ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product){
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {

  ShoppingList({Key key,this.products}): super(key: key);

  final List<Product> products;

  @override
  _ShoppingListState createState() => new _ShoppingListState();

}

class LearnWidget5 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new ShoppingList(
        products: <Product>[
          new Product(name: 'Android'),
          new Product(name: 'iOS'),
          new Product(name: 'React-Native'),
          new Product(name: 'Flutter'),
          new Product(name: 'Weex'),
          new Product(name: 'H5'),
        ],
      )
    );
  }

}