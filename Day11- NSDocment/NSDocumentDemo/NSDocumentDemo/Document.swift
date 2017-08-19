//
//  Document.swift
//  NSDocumentDemo
//
//  Created by Alexcai on 2017/8/19.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class Document: NSDocument {

    
    var readText = ""
    
    
    var myVC : ViewController?
    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    /** 这个方法返回true ,表示,编辑的文件支持自动存储功能 */
    override class func autosavesInPlace() -> Bool {
        return true
    }

    /** 这个方法,是用来进行UI 初始化(搭建界面的)  */
    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: "Document Window Controller") as! NSWindowController
        self.addWindowController(windowController)
        
        myVC = windowController.contentViewController as? ViewController
        
        // 读取数据成功后,在这里进行UI控件的赋值操作: 就是将读取的数据,传递给相应的控件进行展示
        if readText.characters.count > 0 {
            myVC?.textView.string = readText
        }
        
    }

    /** 这个方法是,保存(写数据)编辑内容时会调用 */
    override func data(ofType typeName: String) throws -> Data {
        // Insert code here to write your document to data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning nil.
        // You can also choose to override fileWrapperOfType:error:, writeToURL:ofType:error:, or writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
        
        
        // 在这个方法里,要将数据保存到文件中
        
        // 说明内容不为空,可以保存,如果为空,则返回
        if (myVC?.textView.string?.characters.count)! > 0 {
            let resultText = (myVC?.textView.string)!
            return resultText.data(using: .utf8)!
        }
        
        
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    
    /** 这个方法,当从磁盘中读取文档时,会调用这个方法来解析数据(读数据时,UI界面可能尚未初始化) */
    override func read(from data: Data, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning false.
        // You can also choose to override readFromFileWrapper:ofType:error: or readFromURL:ofType:error: instead.
        // If you override either of these, you should also override -isEntireFileLoaded to return false if the contents are lazily loaded.
        
    
        if String(data: data, encoding: .utf8) != nil {
           readText = String(data: data, encoding: .utf8)!
        }
       
        
        /** 注意事项:
         
         这里不要直接使用print() 函数来打印输出 ,因为NSDocument 类,有一个print函数用来执行文档的打印(输出至打印机)
         如果需要打印输出变量,可以自定义一个函数来实现
          **/
        
//        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }


}

