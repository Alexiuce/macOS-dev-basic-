## macOS AppKit 的事件响应简介
![](https://ws1.sinaimg.cn/large/006tKfTcgy1fll1615zqtj30ms0ome1j.jpg)

> 在*AppKit*中的事件都处于一个响应的链条中,这个链条是由一个叫做`NSResponder` 的类定义的,这个响应链条其实是一个列表,它里面装满了能够响应用户事件的对象.当用户点击鼠标,或者按下键盘的某个键,或者触摸触控板,都会生成一个`Event`事件,然后在响应链条中寻找可以处理这个事件的对象对事件进行处理.
> 一个对象如果可以处理事件,那么这个对象必须继承自`NSResponder`这个类.在AppKit中,*NSApplication*,*NSWindow*,*NSView*都继承自`NSResponder`

一个NSResponder实例对象有三个组件:事件消息(鼠标,键盘,触控板等产生的),动作消息(action message: 比如NSButton 执行target 的action 方法,就属于一种action消息),和响应链条

一个应用(NSApplication对象)维护着一组窗口(NSWindow)列表,这些窗口都属于这个App,每个窗口对象又维护着一组继承自NSView的对象,这些NSView对象通常用来绘制交互界面以及处理响应事件.  

* 每个应用都拥有一个单利的NSApplication对象来管理主线程的事件循环(main runloop),以及跟踪窗口和菜单的消息,分发事件给相应的对象,建立自动释放池和接收App级别的通知消息.
* NSApplication对象通过run()方法来开启事件循环(event loop).**这个方法在main()函数中**
* 在Xcode项目工程中,NSApplicationMain()类似下面这样的效果:

    ```
    void NSApplicationMain(int argc ,char * argv[]){
         [NSApplication shareApplication];
         [NSBundl loadNibNamed:"main" owner: NSApp];
         [NSApp run];
    }
    ```
* NSApplication 对象通过调用自身的类方法初始化显示的数据环境,然后挂接到macOS系统的`窗口服务`(接收事件)和`显示服务`(显示内容)中.
* NSApplication 的一个重要任务就是从macOS系统的`窗口服务`中接收事件(Event),然后将它们派发到相应的NSResponsder对象.
* NSApplication 会将接收到的Event 转换为NSEvent 对象.
* 所有的鼠标和键盘事件都会被NSApplication 派发到与之关联的某个具体的NSWindow 对象中,但有一种情况例外:**如果按下的是Command(⌘)键,那么所有的NSWindow对象都有机会响应这个事件.**
* NSApplication同时会响应(或派发)接收到的Apple Event(**这个比较重要**),比如应用启动或者被再次打开(reopened),这个最常用的一个使用场景是通过URL打开我们的App(**处理方式与iOS不同哦,需要特别注意呀**),前提是需要使用NSAppleEventManager类对事件进行注册!!,通常都是写在applicationWillFinishedLaunching(_:)这个方法中.
* NSApplication同时负责与macOS的系统服务交互(**需要制作系统偏好设置的同学可要注意这里哦**),这样可以使你通过服务菜单提供一些系统设置.
* NSAPPlication可以设置Delegate(这个就不细说了,基本与iOS相似)来响应一些具体消息.

一个窗口对象(NSWindow)处理窗口级别的事件(window-level events)以及将其他事件传递给窗口中的视图对象,同时一个NSWindow还允许通过它的delegate实现自定义窗口的行为方式.

#### 一个事件(Event)是怎样开始传递到应用(Cocoa Application)的?
  *我们这里说的事件,是指用户通过连接到macOS系统中的鼠标,键盘或者触控板,手写笔等硬件设备的具体操作(比如按下鼠标的按键).*
  
  ![Apple event ](https://ws4.sinaimg.cn/large/006tKfTcly1flfe5jo843j30ks0nkwhl.jpg)  
  我们以最常用的`鼠标`或`键盘`操作来说明`事件传递`到应用的过程.当用户按下鼠标或者键盘时:  
  
* 1.硬件设备首先检测到用户的这个操作,然后通过`驱动程序`将这个`操作动作`转换为`操作数据`.
* 2.驱动程序将`操作数据`准备好之后,会调用macOS内核系统的`I/O Kit`,生成一个硬件级别的`事件`.
* 3.驱动程序将这个`事件`发送到macOS系统的`窗口服务`的`事件队列`中.
* 4.驱动程序通知macOS的`窗口服务`,告知其已经添加了一个`事件`到`队列`中待处理.
* 5.macOS的`窗口服务`收到`驱动程序`的消息后,会寻找对应的进程(也就是应用程序).
* 6.当`窗口服务`找到App 进程后,会将`事件`派发到这个应用进程的`runloop`
* 7.当应用进程的`runloop`接收到`事件`后,就开始了`事件`响应机制,从此刻后,将`事件`将遵循`NSResponder`类的处理.

> *通常情况下,应用程序只有在前台运行的时候才会接收鼠标和键盘的事件;当应用处于后台时,即便是在运行中,一般也不会响应鼠标和键盘的事件,除非是要将这个应用唤醒到前台的事件才会得到响应*

#### 事件循环runloop
每个应用都有一种明确的机制用来确保从操作系统的`窗口服务`中获取事件(Event).在Cocoa Application中,这种机制叫做runloop(一个NSRunLoop对象,它允许进程接收`窗口服务`的各种来源).默认情况下,OSX中每个线程都有自己的runloop.NSAPplication 主线程的runloop称为main runloop,主事件循环的一个显著特点是它由NSApplication对象创建的事件输入源(也就是其他对象,通常是操作系统的`窗口服务`,可以向它添加事件源).
为了能从`窗口服务`接收事件和对接收到的事件进行处理,runloop通常包含这两个部分:端口(Mach port)和事件队列(queue)
![](https://ws3.sinaimg.cn/large/006tNc79gy1flggycyukvj30oy0d8406.jpg)

* 端口(Mach port):用来从操作系统的`窗口服务`中获取事件(Event)
* 队列(Event queue):保存这些事件,直到它们被响应处理.


从另一种意义上讲,应用程序是被事件(event)驱动的:

* 它从runloop的事件队列中获取一个事件(NSEvent)
* 派发事件(NSEvent)到合适的对象(Object)
* 事件被处理完成后,再取下一个事件(NSEvent),直到应用退出.

#### 事件分发(Event Dispatch)
在主事件循环中(`main event runloop`),应用程序对象(NSApp)会不断的从事件队列中(event queue)获取最前面的事件,然后将它转换为NSEvent 对象后,派发到最终目标.

* `NSApp`是通过`nextEventMatchingMask:untilDate:inMode:dequeue:`这个方法从事件队列中获取到事件,当事件队列为空的时候(也就是队列中无事件),这个方法会阻塞,直到有新的事件到来才会继续.
* `NSApp`将事件转换为NSEvent后,第一件事就是调用sendEvent:方法进行派发.
* 大部分的情况下,`NSApp`都会将事件派发给用户操作的那个窗口(NSWindow),这是通过调用窗口(NSWindow)的sendEvent:方法完成的.
* `NSWindow`窗口对象将事件以`NSResponder Message`消息的形式(比如`mouseDown:`或者`keyDown:`)派发到与用户操作关联的`NSView`对象.
* `NSWindow`派发事件时会根据事件类型略有不同:对于鼠标和触控板事件,`NSWindow`对象会将事件派发到用户鼠标点击的NSView.对于键盘(`keyboard`)事件,`NSWindow`通常会将事件派发给`key Window`的`第一响应者`

由此可见,在事件派发的过程中,会根据事件种类(AppKit中定义的`NSAppKitDefined`类型)的不同而进行不同的派发选择.有些事件只能由NSWindow或者NSApplication自身来处理,比如应用的隐藏/显示/激活状态/失去激活状态等.

##### 鼠标(或触控板)事件派发路径
前面已经提到过,一个`NSWindow`对象使用sendEvent:方法将鼠标事件派发给用户操作的视图(NSView)对象.那么`NSWindow`是怎样识别是哪个NSView在被用户操作呢?是通过调用`NSView`的`hitTest:`方法,根据这个方法的返回值(通常是显示在最顶层的View)来确定.
`NSWindow`对象是将事件以一个与鼠标相关的`NSResponder`明确消息方式发送视图(NSView),比如`mouseDown:`,`mouseDragged:`,或者`rightMouseUp:`,如果是鼠标按下事件,`NSWindow`还会询问`NSView`是否希望成为第一响应者,以便接收`键盘`和`action`消息.

一个`NSView`对象可以接收三种类型的鼠标事件:**鼠标点击**,**鼠标拖拽**和**鼠标移动**.
鼠标点击事件可以根据点击方向(`按下或抬起`)和鼠标按钮(`左键,右键,或其他`)被进一步的细化分类,这些定义在了`NSEventType` 和 `NSResponder` 中.

`鼠标拖动事件`和`鼠标抬起事件`通常都会被发送给之前**鼠标按下的那个视图(NSView)对象**.

鼠标移动事件通常会派发到`第一响应者`.

当用户在一个视图控件上点击鼠标按钮后,如果包含这个视图的NSWindow不是key Window,那么这个NSWindow将会变成key Window,并且丢弃本次的鼠标事件;也就是说如果你用鼠标点击了一个不是key Window窗口中的一个(NSButton)按钮时,这个点击动作仅仅是将这个窗口(`NSWindow`)对象变成`key Window`而已,你还需要使用鼠标`再次点击`这个按钮,此时这个按钮才会接收到`鼠标点击`的事件. **如果你要避免这种情况,可以通过重写NSView的acceptsFirstMouse: 方法,并返回YES**

`NSView` 通常会自动接收`鼠标点击`和`鼠标拖拽`事件,而不会主动接收`鼠标移动`事件.因为`鼠标移动`事件发生的太过频繁,**很容易阻塞事件队列**,所以默认情况下`NSView`不响应`鼠标移动`事件.如果一个NSView需要处理`鼠标移动`事件,那么需要向它的窗口对象(NSWindow)明确的声明一下,也就是调用NSWindow的 setAcceptsMouseMovedEvents:方法

##### 键盘事件派发路径
响应键盘输入是事件派发中最复杂的部分之一.Cocoa 应用程序会遍历每一个键盘事件来确定它属于那种类型然后以及如何处理.先来看一下苹果官方给出的一个键盘事件可能的传递传递路径:
![](https://ws3.sinaimg.cn/large/006tKfTcgy1fll1pqjm7xj30yg10qtgg.jpg)

下面我们来解释一下:

1. `Key equivalents`(快捷键): 通常是一个或者一组键(通常是与⌘,⌥,⌃等组合),它们被绑定到应用(`NSApplication`)的某个菜单栏条目(`menu item`)或者某个`NSObject 控件对象` ,当按下这个(或这组)键时,就相当于选中了菜单栏或者点击了控件对象.
2. NSApplication接收到`Key equivalents`(快捷键)事件时,会先传递给`key window`的视图(NSView)体系中,通过给每个对象发送performKeyEquivalent:消息来确认是否有控件响应此事件(根据这个方法的返回值来确认:YES代表响应,NO则是不响应*默认为NO*),如果视图(NSView)体系中没有任何对象响应,那么NSApplication会将这个快捷键事件发送给menu bar(菜单栏).在Cocoa 的一些类中,比如 `NSButton`, `NSMenu`, `NSMatrix`, 和 `NSSavePanel` 都提供了默认的响应处理.
3. `Keyboard interface control` (控制键): 键盘的控制键事件通常是用来在用户界面上控制当前焦点对象的.在key window中,NSWIndow对象负责对接收到的`Keyboard interface control`事件进行具体的解释.例如按下`Tab`键会将当前焦点从一个控件转移到下一个上面;按下`Shift-Tab`会按照反方向移动焦点;按下`Space bar`(空格)会模拟鼠标点击等等.这些交互的控件顺序你可以通过(Xcode中的)Interface Builder来构建也可以通过代码来控制(使用**NSView**的 `setNextKeyView:` 和 `nextKeyView` 方法)

关于控制键的更详细内容,有兴趣的同学可以通过这个链接[Handling Key Events](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/EventOverview/HandlingKeyEvents/HandlingKeyEvents.html#//apple_ref/doc/uid/10000060i-CH7-SW9)查看苹果官方的文档


4. `Keyboard action`(命令键):这种事件通常是指预先将种操作通过`按键绑定机制`[Text System Defaults and Key Bindings](Text System Defaults and Key Bindings)绑定到某个具体的物理按键上,当这个按钮被按下时,执行特定的方法,比如 `pageDown:`, `moveToBeginningOfLine:` 和`capitalizeWord:`. NSWindow通常会将命令键的event发送到窗口内的第一响应者对象.
5. 如果是文本字符事件,那么会将按键字符插入到文本中.  

在`应用程序`处理键盘事件时,如果这个事件不是`快捷键(Key equivalents)`或者`控制键Keyboard interface control`,那么`应用程序`会将事件通过`sendEvent:`方法发送给`kew window`,然后窗口(key window)对象会调用第一响应者的`keyDown:`方法,将事件传递到整个响应链条中.

关于键盘事件的派发与处理细节,大家可以查看苹果官方文档[Handling Key Events](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/EventOverview/HandlingKeyEvents/HandlingKeyEvents.html#//apple_ref/doc/uid/10000060i-CH7-SW1)

##### 其他事件派发

在应用程序中,我们可以使用`NSTrackingArea`类添加一个监控区域,这些事件`NSWindow`对象会直接派发到拥有这个区域的指定对象(通常发送 mouseEntered:和 mouseExited:消息).

应用程序(NSApplication)生成的周期性事件(NSPeriodic)通常不会使用`sendEvent:`派发,它们是通过某个NSObject对象注册后(通过调用nextEventMatchingMask:untilDate:inMode:dequeue: 方法)才会得到处理.具体的详细内容,可以参考[Other Types of Events](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/EventOverview/EventObjectsTypes/EventObjectsTypes.html#//apple_ref/doc/uid/10000060i-CH4-SW6)

