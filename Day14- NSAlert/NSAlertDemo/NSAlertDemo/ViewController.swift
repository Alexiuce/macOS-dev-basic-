//
//  ViewController.swift
//  NSAlertDemo
//
//  Created by Alexcai on 2017/8/21.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /**
     
     1. 显示Alert 的标题文字
      messageText: String
      
     2. 提示详情文字
      informativeText: String
     
     
     3. 设置图片icon. 默认值是 NSApplicationIcon.
     icon: NSImage!
     
     
     4. 添加操作按钮的方法(添加的顺序是从右到左排列).
     func addButton(withTitle title: String) -> NSButton
     
     5. 获取所有的操作按钮(数组) : 最右边的按钮序号(index)为0
      buttons: [NSButton] { get }
     
     6. 是否显示帮助选项  (如果要使用帮助选项,需要设置(下面的属性:helpAnchor)的值)
      showsHelp: Bool
     
     7. 帮助的索引内容
      helpAnchor: String?
     
     8. NSAlert 样式 (级别):不同样式的级别不同
      alertStyle: NSAlertStyle
     
     
    9 . 代理属性(用来响应帮助选项的事件)
      delegate: NSAlertDelegate?
    10 . 是否显示一个可勾选的按钮选项提示
     showsSuppressionButton: Bool
     
    11. 这个就是可勾选的按钮
     open var suppressionButton: NSButton? { get }
     
     
   12. 添加自定义的辅助视图
    accessoryView: NSView?
     
     
    13 . NSAlert 立刻更新UI控件布局(默认情况下,NSAlert是在要显示的时候,才会开始布局UI)
    func layout()
     
     
    14. 已独立的窗口方式显示NSALert  : 根据这个方法的返回值,来确定用户的操作的选项
    runModal() -> NSModalResponse
     
    15. 已内嵌的方式显示NSAlert : 在闭包中获取用户操作的选项
    beginSheetModal(for sheetWindow: NSWindow, completionHandler handler: ((NSModalResponse) -> Swift.Void)? = nil)
     
     
     16. 显示的window
     open var window: NSWindow { get }
     */

    @IBAction func showAlert(_ sender: Any) {
        let alert = NSAlert()
        
        alert.messageText = "This is A Alert Demo Title"
        
        alert.informativeText = "this is a detail message about the title for alert"
        
//        alert.icon = NSImage(named: "alert")
        
        alert.addButton(withTitle: "按钮1")
        alert.addButton(withTitle: "按钮2")
        
        alert.showsSuppressionButton = true
        alert.suppressionButton?.title = "是否不再显示"
        alert.delegate = self
        alert.showsHelp = true
        alert.helpAnchor = "NSAlert"
        let imageView = NSImageView(frame: NSMakeRect(0, 0, 200, 100))
        imageView.image = NSImage(named: "alert")
        alert.accessoryView = imageView
        
        // 如果要修改accessoryView的位置,需要先调用layout方法
        alert.layout()
        
        imageView.frame = NSMakeRect(100, 0, 200, 100)
        
        // 显示NSAlert方式1: alert 内嵌在App的当前view的window中
        alert.beginSheetModal(for: view.window!) { (result) in
            // 根据suppressionButton?.state 获取用户是否选中勾选的项
            print(alert.suppressionButton?.state)  // on ,off
            if result == NSAlertFirstButtonReturn {
                            print("点击了第一个按钮")
                        }else if result == NSAlertSecondButtonReturn{
                            print("点击了第二个按钮")
                        }
            
        }
        // 显示方式2 : alert 单独的显示窗口
//        let result = alert.runModal()
//        
//        
//        if result == NSAlertFirstButtonReturn {
//            print("点击了第一个按钮")
//        }else if result == NSAlertSecondButtonReturn{
//            print("点击了第二个按钮")
//        }
       
    
        
    }
}

extension ViewController : NSAlertDelegate{
    func alertShowHelp(_ alert: NSAlert) -> Bool {
        
        print("点击了帮助选项")
        // false : 表示代理未处理,系统采用默认方式处理帮助选项操作事件
        // true : 表示代理已处理帮助操作,系统不会再处理
        // 项目中,一般都会在这里进程跳转帮助的URL地址
        
        return true
    }
}

