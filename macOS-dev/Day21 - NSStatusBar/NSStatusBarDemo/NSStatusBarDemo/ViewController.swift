//
//  ViewController.swift
//  NSStatusBarDemo
//
//  Created by Alexcai on 2017/8/26.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    var isShowMainWindow = false    // 默认不显示主窗口
    
    
    @IBOutlet var myMenu: NSMenu!
    
    var myStatusItem : NSStatusItem?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. 创建NSStatusBar对象
        let statusBar = NSStatusBar.system()   // 系统的状态栏
        // 2. 创建并添加了一个NSStatusItem到状态中
        let statusItem = statusBar.statusItem(withLength: NSVariableStatusItemLength)
        
        // 3. 设置显示图标
        
        /** 根据NSStatusBar的对象, 无法获取系统状态栏的主题颜色(也就是背景色)
         如果系统我们App状态的图标icon能够适配状态栏的主题背景,需要设置图片的isTemplate属性为true即可
         */
        let icon =  NSImage(named: "icon")
        icon?.isTemplate = true   // 这个属性用来适配系统状态栏背景色
        
        statusItem.image = icon
        myStatusItem = statusItem
        
        
        // 添加响应事件
        myStatusItem?.target = self
        myStatusItem?.action = #selector(clickStatusItem)
        
        // 给状态栏添加显示菜单
        /** NSStatusItem的meun属性,直接赋值后,即支持鼠标左键点击显示*/
        myStatusItem?.menu = myMenu
        /** 普通的控件,直接设置menu属性,表示的是鼠标右键点击的菜单 */
        //view.menu = myMenu
        
        
        /** 这里使用代码设置App Dock上的图标隐藏
         如果在info.plist文件设置 Appliaction is Agent 为true,window不会隐藏
         */
        NSApp.setActivationPolicy(.accessory)
        
        // Do any additional setup after loading the view.
    }
    @IBAction func clickConfigItem(_ sender: NSMenuItem) {
        print("点击了config item")
    }
    
    // 点击状态的Main选项,显示主窗口界面
    @IBAction func showMainWindow(_ sender: NSMenuItem) {
        
        
        isShowMainWindow = true
        // 显示主窗口
        view.window?.makeKeyAndOrderFront(nil)
    
        // dispatch_once
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        if  isShowMainWindow == false {
            
            // 视图显示出来的时候,关闭窗口(相当于点击窗口上的close 按钮操作)
            view.window?.close()
            
        }
        
    }

    
    
}

// MARK: - 事件响应方法
extension ViewController{
    func clickStatusItem()  {
        print("点击了状态按钮")
    }
}


