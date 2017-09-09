//
//  ViewController.swift
//  NSTooBarDemo
//
//  Created by Alexcai on 2017/8/28.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
//    @IBOutlet var myToolBar: NSToolbar!

    var toolBar : NSToolbar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 这里获得window是空值,所以这句代码相当于什么都没做
//         view.window?.toolbar = myToolBar

        
        toolBar = NSToolbar(identifier: "myToolBar")
        
        
        
        toolBar?.delegate = self
        
        
        
        
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        // 只有在控制器的这个方法中,获取的view.window才有值
        
        // 设置窗口的toolBar属性,就可以显示对应的工具栏
         view.window?.toolbar = toolBar
//
    }

//    @IBAction func clickedMyItem(_ sender: NSToolbarItem) {
//        print("点击我们自己的item")
//    }


}

// MARK: - 通过代码创建NSToolBar
/**
 如果是用代码创建的NSToolBar,必须实现代理方法
 否则报错
 
 代理方法实现的方法有
 1. 可以有哪些需要显示的标识符
 2. 有哪些备用的NSToolBarItem的标识符
 3. 每个标识符的NSToolBarItem的具体是什么
 
 
 如果是使用在Storyboard中添加的方式,可以忽略代理方法
 
 */

extension ViewController : NSToolbarDelegate{
    // 这里对应的第一条(57行处)
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [String] {
        return ["first"]
    }
    
    // 对应的是第二条(58行处)
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [String] {
        return ["first"]
        
    }
    // 对应的是第三条(59行处)
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: String, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        
        if itemIdentifier == "first" {
            
            // NSToolBarItem只能在创建的时候设置标识
            let item = NSToolbarItem(itemIdentifier: "first")
            
            item.label = "Code Item"
            item.image = NSImage(named: NSImageNameApplicationIcon)
            item.target = self
            item.action = #selector(clickedMyCustomItem)
            
            return item
            
        }
        return nil
        
        
    }
    
    
    func clickedMyCustomItem()  {
        print("点击了代码创建的item事件")
    }
}


