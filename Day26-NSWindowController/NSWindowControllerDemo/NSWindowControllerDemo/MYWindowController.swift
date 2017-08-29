//
//  MYWindowController.swift
//  NSWindowControllerDemo
//
//  Created by Alexcai on 2017/8/29.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class MYWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        // 这个属性用来获取窗口对象
        window?.title = "hello window"
        print("窗口被加载到内存中")
        window?.titlebarAppearsTransparent = true
        

        // 推荐使用
//        contentViewController = MYContentController()
        //
        // 不建议使用
//       contentViewController = storyboard?.instantiateController(withIdentifier:"vc1") as? NSViewController
        
      // 这里可能会经常遇到到问题是: 这里到Storyboard根据标识符加载到控制器可能报错,所以不建议从Storyboard中键值自定义到控制器,推荐使用xib到方式创建控制器
        
        // 跟Xcode有关
        
    
        
        
        
       
    }

}


// MARK: - NSWindowController 没有像NSViewController 一样到presnet方法显示新到控制器界面

// 如果要显示新到NSWindowController到界面,需要调用窗口控制器到方法showWindow()

// NSWindowController到显示内容,是根据它到内容视图控制器来决定到.也就是说,NSWindowController 有个一个contentViewController属性,是用来设置视图内容控制器到


/**
 
 macOS中,视图和窗口的加载顺序是:
 
 先创建视图(view) -> 加载视图到内存 -> 创建window -> 加载window到内存 -> 视图显示(view didAppeared)
 
 */
