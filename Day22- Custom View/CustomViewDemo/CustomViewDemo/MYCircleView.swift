//
//  MYCircleView.swift
//  CustomViewDemo
//
//  Created by Alexcai on 2017/8/27.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class MYCircleView: NSView {

    /** 设置每个饼图颜色的占比
     0~100%: 根据这个数组里的值,来将360度进行划分
     */
    var colorRations = [Float]() {
        didSet{
            needsDisplay = true
        }
    }
    
    /** 设置饼图的分割线宽度 */
    var circleLineWidth : CGFloat = 1 {
        didSet{
            needsDisplay = true
        }
    }
    
    /** 设置分割线颜色 */
    var circleLineColor = NSColor.lightGray {
        didSet{
             needsDisplay = true
        }
    }
    // 通过这个颜色数组,设置显示的颜色,供外界调用
    var circleColors = [NSColor]() {
        didSet{
            // 跟新颜色时,同时刷新视图绘制
            needsDisplay = true
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        // 这里进行绘制饼图
        // 获取绘制矩形区域的宽与高的最小值
        let newWH = min(NSWidth(dirtyRect), NSHeight(dirtyRect)) - circleLineWidth
        
//        let newRect = NSMakeRect(NSMinX(dirtyRect), NSMinY(dirtyRect), newWH, newWH)
        
//        let circlePath = NSBezierPath(ovalIn: newRect)
//        NSColor.orange.set()
//        circlePath.fill()
        
        
//        NSColor.blue.set()
        // 1 获得圆心位置
        let centerX =  NSMinX(dirtyRect) + NSWidth(dirtyRect) * 0.5
        let centerY = NSMinY(dirtyRect) + NSHeight(dirtyRect) * 0.5
        let circleCenter = NSPoint(x:centerX, y: centerY)
        let radius = newWH * 0.5
        var startAngel :CGFloat = -30.0
        var endAngel : CGFloat = -30.0
        
        
        for i in 0..<circleColors.count {
            let deltaAngel = CGFloat(360 * colorRations[i])

            endAngel = startAngel + deltaAngel
    
            let path = NSBezierPath()
            path.move(to: circleCenter)
            path.appendArc(withCenter: circleCenter, radius: radius, startAngle: startAngel, endAngle:endAngel , clockwise: false)
            path.close()
            path.lineWidth = circleLineWidth
            circleLineColor.set()
            path.stroke()
            
            circleColors[i].set()
            path.fill()    // 填充绘制
            //path1.stroke()  // 描边绘制
            startAngel = endAngel
        }
        
        /*
        // 2.绘制一个圆弧
        let path1 = NSBezierPath()
        path1.move(to: circleCenter)
        let radius = newWH * 0.5
        path1.appendArc(withCenter: circleCenter, radius: radius, startAngle: -30, endAngle: 90, clockwise: false)
        path1.close()
        path1.fill()    // 填充绘制
        //path1.stroke()  // 描边绘制
        
        let path2 = NSBezierPath()
        path2.move(to: circleCenter)
        NSColor.green.set()
        path2.appendArc(withCenter: circleCenter, radius: radius, startAngle: 90, endAngle: 210, clockwise: false)
        path2.close()
        path2.fill()    // 填充绘制
        //path2.stroke()  // 描边绘制
        
        
        let path3 = NSBezierPath()
        path3.move(to: circleCenter)
        NSColor.red.set()
        path3.appendArc(withCenter: circleCenter, radius: radius, startAngle: 210, endAngle: 330, clockwise: false)
        path3.close()
        path3.fill()    // 填充绘制
        //path3.stroke()  // 描边绘制
        */
        
    }
    
    // MARK: - 使用Core Animation 来自定义视
    override var wantsUpdateLayer: Bool{
        /** 返回true : 表示使用Core Animation的Layer 来绘制视图,
                      不再调用draw方法刷新视图,而是调用updateLayer刷新视图
        */
        return true
    }
    // 当wantsUpdateLayer为true时,系统调用这个方法进行视图的绘制和显示
    override func updateLayer() {
        
        let newWH = min(NSWidth(bounds), NSHeight(bounds)) - circleLineWidth

        // 1 获得圆心位置
        let centerX =  NSMinX(bounds) + NSWidth(bounds) * 0.5
        let centerY = NSMinY(bounds) + NSHeight(bounds) * 0.5
        let circleCenter = NSPoint(x:centerX, y: centerY)
        let radius = newWH * 0.5
        var startAngel :CGFloat = -30.0
        var endAngel : CGFloat = -30.0
        
        for i in 0..<circleColors.count {
            let deltaAngel = CGFloat(360 * colorRations[i])
            
            endAngel = startAngel + deltaAngel
            
            let path = NSBezierPath()
            path.move(to: circleCenter)
            path.appendArc(withCenter: circleCenter, radius: radius, startAngle: startAngel, endAngle:endAngel , clockwise: false)
            path.close()
            
            let circleLayer = CAShapeLayer()
            // MARK: - 在macOS中,NSBezierPath 没有cgPath的方法,需要手动实现NSBezierPath->CGPath的转换
            circleLayer.path = path.cgPath
            // 设置颜色使用layer的方法
            circleLayer.fillColor = circleColors[i].cgColor  // layer的填充颜色
            circleLayer.strokeColor = circleLineColor.cgColor   // layer的描边颜色
            circleLayer.lineWidth = circleLineWidth
            layer?.addSublayer(circleLayer)
            
            

            startAngel = endAngel
        }

        
//        let circleLayer = CAShapeLayer()
//        circleLayer.frame = bounds
//        circleLayer.backgroundColor = NSColor.red.cgColor
//        let circlePath = NSBezierPath(ovalIn: bounds)
//       // MARK: - 在macOS中,NSBezierPath 没有cgPath的方法,需要手动实现NSBezierPath->CGPath的转换
//        circleLayer.path = circlePath.cgPath
//        
//        layer?.addSublayer(circleLayer)
        
        
    }
    
}






