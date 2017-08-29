//
//  NewWindowController.swift
//  NSWindowControllerDemo
//
//  Created by Alexcai on 2017/8/29.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class NewWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        
        // 设置窗口控制器要显示到内容控制器
        contentViewController = MYContentController()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
}
