# NSContainerView  : 特殊的容器视图

* 在macOS中并没有这个类,它是一种特殊的NSView
* NSContainerView 不能使用代码创建,仅在Storyboard中提供使用

* 优点:
   1.解耦:
     从MVC架构上看,NSContainerView将一个视图的内容单独分离到一个控制中进行管理,避免了在主控制器中添加过多UI和数据逻辑代码

    2.便于将一个复杂的视图分成几个独立的视图
 * 不足:
   NSContainerView 只支持一个Embed的NSViewController
   这在管理多个控制器界面时,会显得不方便.

 