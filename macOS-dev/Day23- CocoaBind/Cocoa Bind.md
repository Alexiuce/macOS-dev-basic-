# Cocoa Binding - macOS专有的数据驱动视图方式

* 对 M(odel)-V(iew)-C(ontroller) 模式的补充

* 目的: 实现视图与数据的互动
> 数据变化时,视图更新展示的内容
> 视图修改内容时,同步更新数据

* KVO


* 视图绑定到模型

* 视图绑定到控制器

> NSUserDefaults 用来存储用户的偏好设置
  NSUserDefaults 不支持KVO方式 ,无法直接对它进行Cocoa 绑定
   NSUserDefaultController : 通过这个Controller,可以实现绑定数据到NSUserDefaults中


