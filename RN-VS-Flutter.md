# React-Native VS Flutter 笔记

> 个人理解无论是RN、Flutter之于Android、iOS，就像React、Vue之于Html一样可以理解为一个UI框架，这也是Flutter对于自己的介绍，但可以看出React、Vue对应前端是一对一而且是优化了性能，和开发成本的。但RN、Flutter是优化开发成本，一端开发多端使用，性能是接近原生(官方声称)。

### 学习成本

### 性能

### 成熟度

### 兼容端

### 社区

### 底层通信机制
#### 1. React-Native、和Weex
> weex和react native 都是JS+原生渲染的

- js通信引擎上：weex引用v8(google开发的性能强劲)，reactnative: JSCore(苹果的，可以让oc和javascript直接交互变得更加方便)
- JS开发框架：weex使用的是vue。reatnative使用的react。都是：组件化，数据绑定，virtual dom。
- Android版本要求：ReactNative使用了Choreographer(帧同步)，因此必须在API16以上才可以使用；weex使用handler来代替Choreographer，可以在API14以上使用。
- 扩展性 : 三方库的接入上，weex对网络，图片，统计等常见的用户可能想自己定制的功能，提供了相应的适配接口，可以由用户方便的定制，ReactNative需要自己修改源码。
- 跨平台：ReactNative支持Android iOS两个平台，需要自己扩展去支持web，windows和node-webkit的支持正在开发中，weex可以支持Android iOS web三个平台。

### 资料
[React Native、weex、Flutter](https://baijiahao.baidu.com/s?id=1608650340331187704&wfr=spider&for=pc)

[React VS Flutter](https://blog.csdn.net/csdnnews/article/details/83746830)