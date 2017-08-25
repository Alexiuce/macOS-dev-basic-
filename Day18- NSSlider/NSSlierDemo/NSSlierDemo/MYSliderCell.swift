//
//  MYSliderCell.swift
//  NSSlierDemo
//
//  Created by Alexcai on 2017/8/25.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class MYSliderCell: NSSliderCell {
    
  
    // 1. 使用自定义图片替换指示标识
    
    override func drawKnob(_ knobRect: NSRect) {
        // 2. 使用图片
        // 在这里使用自定义的图片或者形状来绘制指示标识
        let image = NSImage(named: "indator")
        image?.draw(in: knobRect)
        // 也可以使用自定义的绘图方法,绘制需要内容
        
        // 3. 使用绘图
//        NSColor.green.set()
//        let newRect = NSInsetRect(knobRect, 1, 1)
//        let knobPath = NSBezierPath(ovalIn: newRect)
//            //NSBezierPath(roundedRect: knobRect, xRadius: 5, yRadius: 5)
//            //NSBezierPath(rect: knobRect)
//        knobPath.fill()
    
    }
    
    
    // 自定义指示器左右两边的颜色
    
    override func drawBar(inside rect: NSRect, flipped: Bool) {
        // 0 设置整个bar的背景色(也就是指示器右边的显示颜色)
        
        NSColor.black.set()
        let allPath = NSBezierPath(roundedRect: rect, xRadius: 2, yRadius: 2)
        allPath.fill()
        
        // 1 获取左边的范围
        /** 当前滑动指示标识在整个slide中的比例位置*/
        let ratio = CGFloat((doubleValue - minValue) / (maxValue - minValue))
        // 2. 计算指示器左边的宽度
        let leftWidth = rect.size.width * ratio
        var leftRect = rect
        leftRect.size.width = leftWidth
        
        // 3. 绘制左边的路径
        let leftPath = NSBezierPath(roundedRect: leftRect, xRadius: 2, yRadius: 2)
        // 4. 设置指示器左边的绘制颜色
        NSColor.orange.set()
        leftPath.fill()
        
        

        
    }
    
    
    

}
