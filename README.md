# FlutterStudy

##### 生命周期
1. constructor 1次、构造函数
2. initState 1次、初始化状态
3. didChangeDependencies: n次，初始化后调用一次，监听它继承数Widget改变。
4. build: n次、构造UI刷新的时候就会调用例如：初始化、setState、热更新、横竖屏、祖先节点刷新时
5. didUpdateWidget：n次、组件重建时：热更新时、横竖屏、祖先节点刷新时。
6. deactivate：1次、从渲染树中移除时调用
7. dispose: 1次、组件即将销毁
