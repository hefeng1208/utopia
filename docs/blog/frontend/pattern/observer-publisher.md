---
title: 观察者模式与订阅发布模式的区别
copyright: false
date: 2019-12-10
comments: false
post: true
refer: https://www.cnblogs.com/onepixel/p/10806891.html
categories:
- pattern
tags:
- pattern
---
### 1. 观察者模式
**观察者模式**定义了对象间的一种一对多的依赖关系，当一个对象的状态发生改变时，所有依赖于它的对象都将得到通知，并自动更新。观察者模式属于行为型模式，行为型模式关注的是对象之间的通讯，观察者模式就是观察者和被观察者之间的通讯。
观察者模式有一个别名叫“发布-订阅模式”，或者说是“订阅-发布模式”，订阅者和订阅目标是联系在一起的，当订阅目标发生改变时，逐个通知订阅者。我们可以用报纸期刊的订阅来形象的说明，当你订阅了一份报纸，每天都会有一份最新的报纸送到你手上，有多少人订阅报纸，报社就会发多少份报纸，报社和订报纸的客户就是上面文章开头所说的“一对多”的依赖关系。
### 2. 订阅-发布模式
其实24种基本的设计模式中并没有发布订阅模式，上面也说了，他只是观察者模式的一个别称。
但是经过时间的沉淀，似乎他已经强大了起来，已经独立于观察者模式，成为另外一种不同的设计模式。
在现在的发布订阅模式中，称为发布者的消息发送者不会将消息直接发送给订阅者，这意味着发布者和订阅者不知道彼此的存在。在发布者和订阅者之间存在第三个组件，称为调度中心或事件通道，它维持着发布者和订阅者之间的联系，过滤所有发布者传入的消息并相应地分发它们给订阅者。
举一个例子，你在微博上关注了A，同时其他很多人也关注了A，那么当A发布动态的时候，微博就会为你们推送这条动态。A就是发布者，你是订阅者，微博就是调度中心，你和A是没有直接的消息往来的，全是通过微博来协调的（你的关注，A的发布动态）.
### 3. 区别
发布订阅模式相比观察者模式多了个事件通道，事件通道作为调度中心，管理事件的订阅和发布工作，彻底隔绝了订阅者和发布者的依赖关系。即订阅者在订阅事件的时候，只关注事件本身，而不关心谁会发布这个事件；发布者在发布事件的时候，只关注事件本身，而不关心谁订阅了这个事件。
观察者模式有两个重要的角色，即目标和观察者。在目标和观察者之间是没有事件通道的。一方面，观察者要想订阅目标事件，由于没有事件通道，因此必须将自己添加到目标(Subject) 中进行管理；另一方面，目标在触发事件的时候，也无法将通知操作(notify) 委托给事件通道，因此只能亲自去通知所有的观察者。
<br>我们再来看一下这两个模式的代码实现：
* **订阅-发布模式** 
```javascript
class PubSub {
  constructor() {
    this.subscribers = [];
  }
  subscribe(topic, callback) {
    let callbacks = this.subscribers[topic];
    if (!callbacks) {
      this.subscribers[topic] = [callback];
    } else {
      callbacks.push(callback);
    }
  }
  publish(topic, ...args) {
    let callbacks = this.subscribers[topic] || [];
    callbacks.forEach(callback => callback(...args));
  }
}
 
// 创建事件调度中心，为订阅者和发布者提供调度服务
let pubSub = new PubSub();
// A订阅了SMS事件（A只关注SMS本身，而不关心谁发布这个事件）
pubSub.subscribe('SMS', console.log);
// B订阅了SMS事件
pubSub.subscribe('SMS', console.log);
// C发布了SMS事件（C只关注SMS本身，不关心谁订阅了这个事件）
pubSub.publish('SMS', 'I published `SMS` event');
```
* **观察者模式**
```javascript
class Subject {
  constructor() {
    this.observers = [];
  }
  add(observer) {
    this.observers.push(observer);
  }
  notify(...args) {
    this.observers.forEach(observer => observer.update(...args));
  }
}
 
class Observer {
  update(...args) {
    console.log(...args);
  }
}
 
// 创建观察者ob1
let ob1 = new Observer();
// 创建观察者ob2
let ob2 = new Observer();
// 创建目标sub
let sub = new Subject();
// 目标sub添加观察者ob1 （目标和观察者建立了依赖关系）
sub.add(ob1);
// 目标sub添加观察者ob2
sub.add(ob2);
// 目标sub触发SMS事件（目标主动通知观察者）
sub.notify('I fired `SMS` event');
```
