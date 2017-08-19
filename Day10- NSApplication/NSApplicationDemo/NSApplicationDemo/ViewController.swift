//
//  ViewController.swift
//  NSApplicationDemo
//
//  Created by Alexcai on 2017/8/19.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
// 关闭应用
    @IBAction func closeApp(_ sender: Any) {
        
        /** NSApplictiaon的单利可以简写为NSApp*/
    
        NSApplication.shared().terminate(nil)
        
    }
    /**显示App的数字提醒*/
    
    @IBAction func showAppNumber(_ sender: Any) {
        NSApp.dockTile.badgeLabel = "20"
    }
    /** 实现Dock 上的App 图标弹跳 */
    

    @IBAction func jump(_ sender: Any) {
        /**
          criticalRequest   // 多次跳动App Dock 上的图标,直到用户选中App为活动状态
         
          informationalRequest  // 一次跳动App Dock 上的图标
         */
        // 这个方法只能在当前App 不是处于非活动时才有效
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) { 
            
            NSApp.requestUserAttention(.informationalRequest)
        }
        
        
    }
    
    
    // 隐藏Dock 上的App 图标
    
    @IBAction func hideDockIcon(_ sender: Any) {
        // 隐藏App 图标,会自动隐藏窗口
        NSApp.setActivationPolicy(.accessory)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) { 
            NSApp.unhideWithoutActivation()
        }
        
        
        
        
    }
    // 显示Dock 上的App 图标
    @IBAction func showDockIcon(_ sender: Any) {
         NSApp.setActivationPolicy(.regular)
    }
}

