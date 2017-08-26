//
//  ViewController.swift
//  NSOpenPanelDemo
//
//  Created by Alexcai on 2017/8/26.
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

    @IBAction func openFile(_ sender: NSButton) {
        // 1. 创建openPanel 对象
        let openpanel = NSOpenPanel()
        
        // prompt : 修改默认打开按钮的文字
        openpanel.prompt = "打开"
        openpanel.message = "不要随便选择文件"
        // 设置文件打开的类型: 默认为空,表示可以选择任意类型的文件
//        openpanel.allowedFileTypes = ["jpg","json"]
        openpanel.canCreateDirectories = true
        
        // 设置默认打开的文件路径
        let pathUrl = URL(string:"/Users/Alexcai/Desktop")
        openpanel.directoryURL = pathUrl
        
//        openpanel.allowsMultipleSelection = false
        

        openpanel.delegate = self
        
        // 显示openpanel
        openpanel.beginSheetModal(for: view.window!) { (result) in
            print("\(result)")
            if result == NSModalResponseOK {
                for u in openpanel.urls {
                    print(u.absoluteString)
                }
            }
        }
    }

}

extension ViewController : NSOpenSavePanelDelegate{
    
    // NSOpenPanel 支持
    
    // 当更改了默认打开目录时,调用此代理方法
    func panel(_ sender: Any, didChangeToDirectoryURL url: URL?) {
        print("更换了文件夹")
    }
    
    // 每次打开都会调用这个代理方法,询问是否支持打开该url(被多次调用)
    func panel(_ sender: Any, shouldEnable url: URL) -> Bool {
        print("是否支持打开本url\(url.absoluteString)")
        return true
    }
    // 用户点击确认(或打开)按钮是,会调用这个代理方法
    func panel(_ sender: Any, validate url: URL) throws {
        print("用户确认选择后,可以进行验证url操作")
    }
    // 用户每次选择时,如果支持打开本路径的文件,则会调用这个代理方法,通知了用户已经变更选择
    // 会被多次调用
    func panelSelectionDidChange(_ sender: Any?) {
        print("用户改变了选择")
    }
    
     // 其他的方法是供NSSavePanel使用
    
    
}


