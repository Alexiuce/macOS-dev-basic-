//
//  AppDelegate.swift
//  NSMenuDemo
//
//  Created by Alexcai on 2017/8/23.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    // 1.实现这个方法,并返回一个自己定义的NSMenu 就可以支持在Dock上给APP添加菜单
//    func applicationDockMenu(_ sender: NSApplication) -> NSMenu? {
//        let dockMenu = NSMenu(title: "dock")
//        // 2. 创建要添加的菜单项目
//        let myItem = NSMenuItem(title: "我的设置", action: #selector(clickSetting), keyEquivalent: "")
//        dockMenu.addItem(myItem)
//        return dockMenu
//    }

}

extension AppDelegate{
    func clickSetting()  {
        print("点击了Dock的设置选项")
    }

}

