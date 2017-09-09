//
//  ViewController.swift
//  SandBoxDemo
//
//  Created by Alexcai on 2017/9/1.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    var selectPath = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func selectPath(_ sender: Any) {
        
        let op = NSOpenPanel()
        
        op.canChooseDirectories = true
        op.canChooseFiles = false
        
        op.prompt = "选择目录"
        
        op.beginSheetModal(for:view.window!) { (result) in
            
            // 点击选中按钮
            if result == NSModalResponseOK {
                
                let url = op.urls.last!
                
//                self.selectPath = url.path
//                print(self.selectPath)
                
                // 1. 从用户选择的url中导出书签数据
                
                let bookmarkData = try? url.bookmarkData(options: URL.BookmarkCreationOptions.withSecurityScope, includingResourceValuesForKeys: nil, relativeTo: nil)
                
                
                if bookmarkData == nil { return }
                
                // 2. 将书签持久化(保存到userDefault中)
                UserDefaults.standard.set(bookmarkData!, forKey: "bookmark")
                UserDefaults.standard.synchronize()
                
            }
            
        }
    }
    
    @IBAction func createDirectory(_ sender: Any) {
//        let path = selectPath + "/" + "123"
        
        /**
         Operation not permitted  : 表示没有操作访问的权限
         */
        
        // 1. 获取保存的书签
        let bookmarkData = UserDefaults.standard.value(forKey: "bookmark") as? Data
        
        if bookmarkData == nil {return}
        
        
        var isStale = false
        
        // 2. 根据书签,获取url
        let url = try? URL(resolvingBookmarkData: bookmarkData!, options: URL.BookmarkResolutionOptions.withSecurityScope, relativeTo: nil, bookmarkDataIsStale: &isStale)
        
        if url == nil { return}
        // 3. 开启安全访问书签中url的资源
         let result =  url!?.startAccessingSecurityScopedResource()
        
        
        if  result == nil , result == false { return }
        
        
        guard let path = url!?.path else {
            return
        }
        
        
        do {
            try  FileManager.default.createDirectory(atPath:path + "/" + "234", withIntermediateDirectories: true, attributes: nil)
        } catch let err as NSError {
            print(err.description)
        }
    }
}


// MARK: -  如果需要永久记录用户选择的路径,并可以访问该路径,需要使用书签功能


