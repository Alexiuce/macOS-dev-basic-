//
//  ViewController.swift
//  EventHandlingDemo
//
//  Created by Alexcai on 2017/8/31.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}


// MARK: - Event Handling 笔记

/**
 1. Event的 传递架构
 
 (硬件设备: 鼠标,键盘或者其他设备)触发信号--->(驱动程序进行信号转发) ---> macOS系统的Window Server 事件队列中(Event Queue) ---> 对应Applicaiton中
 
 
 2. Even 的分发
 
   每个Application都有一个主循环(main runloog)--> 从事件队列中获取事件(如果事件队列中没有事件,Application的主循环获取事件的方法就会阻塞,直到有新的事件到来才会再次激活) 
 
   每个应用中,每个线程都有一个runloop,因此应用的主循环是用来跟其他线程的循环区别的一个叫法.
 
   应用的主循环(main runloop)和线程的循环(runloop)最大的不同时,应用在启动后会自动创建主循环(main runloop) ,而线程的runloop时懒加载的方式创建的(也就是在访问线程循环的那一刻才为该线程创建它的runloop)
   
   从系统的事件队列中获取事件的方法是:
                                nextEventMatchingMask:untilDate:inMode:dequeue:
 
 
   从队列中获取到事件之后:
 
   App 将事件进行封装 --> 转为NSEvent对象 --> 调用发送事件方法(sendEvent:),进行事件的分发(通常发送给当前的活动window)  --> window获得事件(NSEvent)后,会继续分发(sendEvent:)到对应View ---> NSView获得事件(NSEvent)后,进行事件(NSEvent)处理
 
   一个NSView是否能响应事件,是根据hitTest:方法的返回值来确认的 : 这个方法的返回对象就是表示可以响应该事件，如果返回nil ,则说明这个NSView不会响应该事件的处理
   如果NSEvent是一个键盘的事件,那么能响应的window,需要是一个keyWindow ,也就是说,如果一个windows不是keyWindow,那么这个window不会响应键盘相关的事件.
 
 
 3. NSView 对(鼠标)事件的响应处理
 
    在macOS中,鼠标的事件有三种类型: 点击事件(mouse-click),拖动事件(mouse-drag),移动事件(mouse-move)
 
    NSView默认会响应鼠标的点击和拖动事件, 如果需要响应移动事件(mouse-move),需要调用所在窗口的方法acceptsMouseMovedEvents,设置为true即可.
 
 **/















