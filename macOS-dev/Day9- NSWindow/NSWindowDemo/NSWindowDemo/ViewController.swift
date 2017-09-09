//
//  ViewController.swift
//  NSWindowDemo
//
//  Created by Alexcai on 2017/8/18.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      

        // Do any additional setup after loading the view.
    }

   
    override func viewDidAppear() {
        super.viewDidAppear()
        
        // 1. 获取window
        let myWindow = view.window
        
        // 2. window 可以设置背景色
        myWindow?.backgroundColor = NSColor.orange
        
        // 3. 设置窗口的按钮(关闭,最小化,全屏幕)
        
//        myWindow?.standardWindowButton(.closeButton)?.isHidden = true
//        myWindow?.standardWindowButton(.miniaturizeButton)?.isHidden = true
//        myWindow?.standardWindowButton(.zoomButton)?.isHidden = true
        
        // 4 . 设置窗口的level(iOS中UIWindow也有这个属性): 可以将窗口置顶
        /** 如果两个window的level一样,就按照出现的顺序,后出现显示最顶层,否则,就按照level大小进行排布,level值越大,越在上面
         */
//        myWindow?.level = Int(CGWindowLevelForKey(.maximumWindow))
        // 5 . 点击窗口背景,支持鼠标拖动窗口
        myWindow?.isMovableByWindowBackground = true
        
        // 7 . DockTile
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            // 窗口需要最小化时,才会有角标提示
              myWindow?.dockTile.badgeLabel = "20"
        }
       // 8 . 设置窗口的标题栏和窗口的样式
        
        // 可以在Storyboard中进行设置
         myWindow?.titlebarAppearsTransparent = true
      // 窗口样式会在NSWindowController的课程中介绍
        myWindow?.styleMask
        
    }
    

    @IBAction func clickBtn(_ sender: NSButton) {
        let myWindow = view.window
        // 6. 触发全屏展示/退出全屏效果
        myWindow?.toggleFullScreen(myWindow)
    
     

    }

}

