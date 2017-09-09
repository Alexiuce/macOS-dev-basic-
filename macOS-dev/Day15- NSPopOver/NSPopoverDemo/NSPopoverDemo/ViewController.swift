//
//  ViewController.swift
//  NSPopoverDemo
//
//  Created by Alexcai on 2017/8/22.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    
    var popVC : NSWindowController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
      
        didSet {
        // Update the view, if already loaded.
        }
    }

    // 点击按钮,显示Popover
    @IBAction func showPopover(_ sender: Any) {
        
        // 1. 创建popover对象
        let popover = NSPopover()
        
        // 2. 从Storyboard中加载控制器
        let popoverVC = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "popover") as! NSViewController
        // 3. 给popover设置内容控制器(用来显示该控制的UI界面)
        popover.contentViewController = popoverVC
        
        /**
         applicationDefined : 默认值,不会自动关闭popover,ESC键也不能关闭,应用关闭时,popovoer会关闭
         semitransient: 点击popover以外的界面部分,不会自动关闭,但ESC按键可以关闭popover
         transient:  点击popvoer界面以外的部分,popover会自动关闭,ESC键可以关闭popover
         */
        popover.behavior = .transient
        
        popover.delegate = self
        
        // 4. 显示popover
        /**
         relativeTo : 类型NSRect 显示popover时,相对的那个区域,也就是popover的三角箭头会指向的矩形边界
         of:  NSView类型, 用来说明第一个参数(矩形范围)是属于那个控件的.
         preferredEdge : 枚举类型,用来说明矩形四条边的那一条边界
         */
        popover.show(relativeTo: view.bounds, of: view, preferredEdge: .maxX)
        
    }
}


extension ViewController : NSPopoverDelegate{
    // 1. 控制popover是否可以关闭,每次popover将要关闭时,都会询问代理的这个方法,如果返回false ,popvoer就不会关闭界面
    func popoverShouldClose(_ popover: NSPopover) -> Bool {
        print("popover is going to be close")
        return true
    }
    
    func popoverDidClose(_ notification: Notification) {
        print("已经关闭")
    }
    func popoverDidShow(_ notification: Notification) {
        print("已经显示")
    }
    func popoverWillShow(_ notification: Notification) {
        print("将要显示")
    }
    func popoverWillClose(_ notification: Notification) {
        print("将要关闭")
    }
    // 如果这个方法返回true ,则popover 支持鼠标拖动
    func popoverShouldDetach(_ popover: NSPopover) -> Bool {
        return true
    }
    
    func detachableWindow(for popover: NSPopover) -> NSWindow? {
        
        popVC = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "popWinvc") as! NSWindowController
        
        return popVC?.window
    }

    
}



