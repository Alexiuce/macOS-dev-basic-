//
//  MYView.swift
//  NSEventHandlingDemo
//
//  Created by Alexcai on 2017/9/1.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class MYView: NSView {

    
    var startPoint = NSZeroPoint
    var currentPoint = NSZeroPoint
    var backColor = NSColor.clear
    
    // 绘制所有路径的数组: 用来保存每次需要绘制的路径
    var allPath : [NSBezierPath] = []
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        backColor.set()
        NSRectFill(dirtyRect)
        
        // 设置线条路径的颜色
        NSColor.yellow.set()
        
        // 遍历所有路径,进行绘制
        for path in allPath {
            path.stroke()
        }
        
        
        
        // Drawing code here.
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // 1. 创建一个区域对象
        let trackArea = NSTrackingArea(rect: bounds, options: [.activeAlways,.mouseEnteredAndExited], owner: self, userInfo: nil)
        
        // 2. 将区域添加的视图
        addTrackingArea(trackArea)
  
        
    }
    
    
    
     // MARK: - 鼠标事件处理
    /** 鼠标左键按下事件*/
    override func mouseDown(with event: NSEvent) {
        
        // 1. 先通过NSEvent 类获取事件发生时,光标在window中的坐标
        let pointInWindow = event.locationInWindow
      
        
        // 2. 将坐标转为view内的坐标系统值
        let pointInView = convert(pointInWindow, from: nil)
        
      
        
         // 创建绘制路径
        let path = NSBezierPath()
        path.move(to: pointInView)
        
        // 将路径添加到数组中,保存起来
        allPath.append(path)
    
        
        
    }
    
    /** 鼠标按键抬起(松开鼠标)事件方法 */
    override func mouseUp(with event: NSEvent) {
        Swift.print("mouseUp")
    }
    /**鼠标拖动事件: 一个拖动事件,必然是处在鼠标按下之后,和鼠标抬起之前*/
    override func mouseDragged(with event: NSEvent) {
        // 1. 先通过NSEvent 类获取事件发生时,光标在window中的坐标
        let pointInWindow = event.locationInWindow
        // 2. 将坐标转为view内的坐标系统值
        let pointInView = convert(pointInWindow, from: nil)
       
        // 从数组中取出路径
        
        let path = allPath.last!
        path.line(to: pointInView)
        
        // 刷新视图, 进行路径绘制
        needsDisplay = true
        
    }
    
    
    /** 鼠标右键抬起事件*/
    override func rightMouseUp(with event: NSEvent) {
        Swift.print("right mouse Up")
        
    }
    
    // MARK: - 如果需要监听鼠标移入或移出状态,需要给视图添加一个追踪区域
    /** 鼠标移入视图的方法*/
    override func mouseEntered(with event: NSEvent) {
        Swift.print("鼠标移入视图")
        
        backColor = NSColor.lightGray
        needsDisplay = true
        
    }
    /** 鼠标移出视图的方法 */
    override func mouseExited(with event: NSEvent) {
        Swift.print("鼠标移出视图")
        
        backColor = NSColor.blue
        needsDisplay = true
    }
    

    
    
    
}
