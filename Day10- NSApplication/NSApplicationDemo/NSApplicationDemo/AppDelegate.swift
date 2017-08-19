//
//  AppDelegate.swift
//  NSApplicationDemo
//
//  Created by Alexcai on 2017/8/19.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa


/** 这个其实就是main函数,就是程序启动的入口操作
 类似与下面的代码作用:
 
 void NSApplicationMain(int argc, char *argv[]) {

     [NSApplication sharedApplication];
     [NSBundle loadNibNamed:@"myMain" owner:NSApp];
     [NSApp run];
 }
 */
@NSApplicationMain



class AppDelegate: NSObject, NSApplicationDelegate {

    var windowNumber = 0

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        /**NSApp.mainWindow 有可能为空*/
        guard let win = NSApp.mainWindow else {
            return
        }
        
        windowNumber = win.windowNumber
        
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    /**点击Dock 需要显示窗口,要实现这个方法*/
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        
        if flag == false {
            // 1. 获取到我们的App 窗口
            let win = NSApp.window(withWindowNumber: windowNumber)
            
            // 2. 让窗口显示
            win?.makeKeyAndOrderFront(nil)
            return true
            
        }
        return !flag
        
    }
}

