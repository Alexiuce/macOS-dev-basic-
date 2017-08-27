//
//  MYBackgroundView.swift
//  CustomViewDemo
//
//  Created by Alexcai on 2017/8/27.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class MYBackgroundView: NSView {

    
    var backgroundColor = NSColor.lightGray{
        didSet{
            // 设置背景色属性后,刷新视图,不要手动调用这个 draw(<#T##dirtyRect: NSRect##NSRect#>)方法
            
            /** 这个属性为true ,就会让系统自动调用draw方法,进行视图的刷新*/
            needsDisplay = true
            // 相当于Objective-C的这个方法: [setNeedDisaplay: YES]
           
        }
    }
    
    
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        // 对视图的自定义绘制,需要在这个方法中进行
        // 当视图需要显示或者刷新时,系统会自动调用这个方法
        
        let backgroundPath = NSBezierPath(rect: dirtyRect)
        backgroundColor.set()
        backgroundPath.fill()
    }
    
}
