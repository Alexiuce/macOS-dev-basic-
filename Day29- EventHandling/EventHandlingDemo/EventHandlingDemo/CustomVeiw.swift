//
//  CustomVeiw.swift
//  EventHandlingDemo
//
//  Created by Alexcai on 2017/8/31.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class CustomVeiw: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        
        let backPath = NSBezierPath(rect: dirtyRect)
        NSColor.red.set()
        backPath.fill()
        
       
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 1. 创建需要区域(被观察的)
        let area = NSTrackingArea(rect: bounds, options: [.activeAlways,.mouseEnteredAndExited], owner: self, userInfo: nil)
        // 2. 添加被观察的区域到视图(这样就可以开启观察效果)
        addTrackingArea(area)
    }
    
    
    
    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        
        // 如果需要mouseMove方法有效,下面这两行代码要被执行才可以
//        window?.makeFirstResponder(self)
//        window?.acceptsMouseMovedEvents = true
    }
    
    
    
    // 事件响应
    // 在NSView类中,不能直接使用print方法,因为是每个NSView类都有一个将视图打印到打印机设备的方法,就是print
    // 如果需要输出变量,要添加类的前缀(命名空间)
    override func mouseDown(with event: NSEvent) {
        Swift.print("点击了鼠标")
        // 1. 通过NSEvent获取鼠标在window 中的坐标
        
        let pointInWindow = event.locationInWindow
          Swift.print("in window\(pointInWindow)")
        // 2. 鼠标在window中的坐标转换为视图内不的坐标
        let pointInView =  convert(pointInWindow, from: nil)
        Swift.print("in view\(pointInView)")
        
        
        
    }
    
    override func mouseUp(with event: NSEvent) {
        Swift.print("松开了鼠标")

    }
    override func mouseDragged(with event: NSEvent) {
        Swift.print("拖动了鼠标")

    }

    /** 鼠标的移入和移出方法,需要设置一个trackArea(追踪区域)才有效*/
    
    override func mouseExited(with event: NSEvent) {
      Swift.print("鼠标移出方法")
    }
    
    override func mouseEntered(with event: NSEvent) {
         Swift.print("鼠标移入的方法")
    }
    
    // 这个方法调用的频率非常高,会对事件队列造成很大影响(因为鼠标移动会产生很多的事件),不建议监听鼠标移动事件
    override func mouseMoved(with event: NSEvent) {
        Swift.print("鼠标移动事件")
    }
    
}
