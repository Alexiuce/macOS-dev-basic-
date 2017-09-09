# NSStatusBar 的基本使用

### 简介
> NSStatusBar是用来管理显示在系统状态栏上的NSStatusItem的类,它继承自NSObject


### NSStautsItem
> 一个NSStatusItem对象表示显示在NSStatusBar上的一个元素
* 创建方法:

    `statusItem(withLength:)` :这个方法将自动添加一个新的NSStatusItem到NSStatusBar中

> NSStatusItem内部拥有一个NSButton,用来设置外观和响应事件