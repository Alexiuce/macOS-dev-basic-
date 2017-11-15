//
//  ViewController.swift
//  NSViewDemo
//
//  Created by Alexcai on 2017/8/13.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa



class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 设置视图的背景颜色
        
        // 1. 创建视图
        let redView = NSView()
        // 2. 设置视图的frame
        redView.frame = NSMakeRect(20, 50, 50, 50)
        
        // 2.1 设置layer的backgroundColor 下面这句代码一定不要忘记
        /** 这句代码的目的是设置redView 为 backed-layer view*/
//        redView.wantsLayer = true
        
        
        // 3. 将视图添加到父视图中
        view.addSubview(redView)
        // 4. 设置redView的背景颜色
        redView.layer?.backgroundColor = NSColor.red.cgColor
       //  view.wantsLayer 的默认值是true, 因此,redVeiw被添加到view 中之后,redView的wantsLayer才为true
        // 所以,设置backgroundColor的才会生效
        
        
        setupBackgroundColor()
        
        // Do any additional setup after loading the view.
    }

 /** NSView的常用属性
     
     1. frame  : 视图的尺寸和位置(相对父视图的坐标系统)
                尺寸:就是指的视图矩形区域的宽和高(NSSize)
                位置:视图在父视图坐标中的距离坐标原点的距离(NSPoint)
     2. bounds : 视图的尺寸和位置(相对自身的坐标系统)
     
     
     3. layer : 图层
     
               与iOS不同,默认的macOS,NSView没有backgroundColor这个属性
     NSView的layer表现方式:
     
      3.1 backed-layer: (backe-layer view)
          默认的view,AppKit自动管理layer,支持设置layer的属性值(可以添加子视图,并且添加的子视图默认都是backed-layer View)
     
      3.2 hosting-layer:(hosting-layer view)
          需要程序员手动指定layer,并有程序员管理layer,hosting-layer view 不能再添加subView(子视图)
     更详细的区别,会在Core Animation中继续讲解
     
     */

}


extension ViewController{
    fileprivate func setupBackgroundColor(){
        
        // 1 方式: 创建layer图层
        let blueView = NSView(frame: NSMakeRect(100, 100, 30, 30))
        
        let layer = CALayer()
        layer.backgroundColor = NSColor.blue.cgColor
        
        layer.frame = blueView.bounds
        
        //
        blueView.layer = layer
        
        
        view.addSubview(blueView)
        
        // 方式2 : 自定义view
        
        let  colorVeiw = ColorView(frame: NSMakeRect(150, 50, 59, 59))
        view.addSubview(colorVeiw)
        
    }
}



