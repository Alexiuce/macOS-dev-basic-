//
//  ViewController.swift
//  NSWindowControllerDemo
//
//  Created by Alexcai on 2017/8/29.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    var  winVC : NewWindowController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Do any additional setup after loading the view.
    }

    
    // 之前都是在控制器的这个方法里对window进行设置
    // 其他,更合适的地方是在NSWindowController中进行设置窗口
    override func viewDidAppear() {
        super.viewDidAppear()
        // 如果设置窗口,需要在这里进行(以前的做法)
        print("view显示到界面上")
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func showNewWindwo(_ sender: Any) {
        // 1. 创建windowController
        let windowController = NewWindowController(windowNibName: "NewWindowController")
        
        windowController.showWindow(view)
        winVC = windowController
        
        
        
        
    }

}

