//
//  ViewController.swift
//  NSMenuDemo
//
//  Created by Alexcai on 2017/8/23.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var rightBtn: NSButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1. 添加右键菜单
        addRightMenu()
        // 3. 在App 主菜单中添加自定义的菜单项目
        addAppMenuItem()
              // Do any additional setup after loading the view.
    }
    func clickItem1(_ sender : NSMenuItem)  {
        print("点击了显示选项")
    }
    
    @IBAction func clickLeft(_ sender: NSButton) {
        // 调用显示左键菜单
        addLeftMenu(sender)
    }

    @IBAction func c3(_ sender: Any) {
        print("click c3")
    }
    @IBAction func c2(_ sender: Any) {
        print("click c2")
    }
    @IBAction func c1(_ sender: Any) {
    print("click c1")
    }
}


extension ViewController{
    // 1. 给控件添加右键菜单
    func  addRightMenu()  {
        // 1. 创建NSMenu对象 : 菜单容器
        let rightMenu = NSMenu(title: "rightMenu")
        // 2. 创建NSMenuItem : 一个菜单项目(菜单条目)
        let item1 = NSMenuItem(title: "显示选项", action: #selector(clickItem1(_:)), keyEquivalent: "")
        let item2 = NSMenuItem(title: "显示选项1", action: #selector(clickItem1(_:)), keyEquivalent: "")
        let item3 = NSMenuItem(title: "显示选项2", action: #selector(clickItem1(_:)), keyEquivalent: "")
        // 3 . 将菜单项添加到菜单中
        rightMenu.addItem(item1)
        rightMenu.addItem(item2)
        rightMenu.addItem(item3)
        // 4. 给控件赋值(右键菜单)
        rightBtn.menu = rightMenu
    
    }
    // 2. 添加左键菜单
    func  addLeftMenu(_ sender : NSButton)  {
        // 1. 创建NSMenu对象 : 菜单容器
        let leftMenu = NSMenu(title: "rightMenu")
        // 2. 创建NSMenuItem : 一个菜单项目(菜单条目)
        let item1 = NSMenuItem(title: "显示选项", action: #selector(clickItem1(_:)), keyEquivalent: "")
        let item2 = NSMenuItem(title: "显示选项1", action: #selector(clickItem1(_:)), keyEquivalent: "")
        let item3 = NSMenuItem(title: "显示选项2", action: #selector(clickItem1(_:)), keyEquivalent: "")
        // 3 . 将菜单项添加到菜单中
        leftMenu.addItem(item1)
        leftMenu.addItem(item2)
        leftMenu.addItem(item3)
        // 4 将菜单与控件事件进行绑定
        NSMenu.popUpContextMenu(leftMenu, with: NSApp.currentEvent!, for: sender)
    }
    // 3. 在App的菜单栏上添加自定义菜单项
    func addAppMenuItem()  {
        
        // 1. 获取App 主菜单
        let mainMenu = NSApp.mainMenu
        // 2. 创建要添加的菜单项目
        let myMenu = NSMenu(title: "myMenu")
        let myItem = NSMenuItem(title: "我的设置", action: #selector(clickSetting), keyEquivalent: "")
//        myMenu.addItem(myItem)
        // 3. 将我们的菜单项目添加到主菜单
        let firstMenuItem = mainMenu?.items.first
        firstMenuItem?.submenu?.insertItem(myItem, at: 0)
        
    }
    
    // 4. 在Dock栏上添加菜单项
    
    
}

extension ViewController {
    func clickSetting()  {
        print("点击了设置选项")
    }
}

