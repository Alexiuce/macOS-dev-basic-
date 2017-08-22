//
//  ViewController.swift
//  NSTextFieldDemo
//
//  Created by Alexcai on 2017/8/20.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var label: NSTextField!
    @IBOutlet weak var textField: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // 1. 设置textField的文字内容
        textField.stringValue = "hello textfield"

        // 2. 设置TextFiled的占位文字
        textField.placeholderString = "this is a placeholder"
        // 3. 设置TextField的属性文字(需要控件不可编辑)
        
//        let attributedText = NSMutableAttributedString(string: "This is Attribute sting")
//        attributedText.addAttributes([NSForegroundColorAttributeName:NSColor.red], range: NSMakeRange(0, 3))
//        attributedText.addAttributes([NSForegroundColorAttributeName:NSColor.orange], range: NSMakeRange(4, 3))
//        label.attributedStringValue = attributedText
        
        // 4. 设置TextFiled的断行模式
        
        // 5. 设置代理,监听TextField的输入改变
        
        textField.delegate = self
    }
}

extension ViewController : NSTextFieldDelegate {
    // 1. 监听TextField进入开始编辑状态
    override func controlTextDidBeginEditing(_ obj: Notification) {
        print("开始编辑")
    }
    
    
    // 2. 监听TextField的文本改变
    override func controlTextDidChange(_ obj: Notification) {
        print("修改内容")
    }
    
    // 3. 监听TextField的结束编辑
    override func controlTextDidEndEditing(_ obj: Notification) {
        print("结束编辑")
    }
    // 4. 监听特定按键输入事件(比如回车键,回退键等...)

    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
        print(commandSelector)
        
        // insertNewline == 回车键
        // deleteBackward == 回退键
        if commandSelector.description == "insertNewline:"  {
            print("按了回车")
        }else if commandSelector.description == "deleteBackward:"{
            print("按了回退")
        }
        
        return false
    }
    

    
}
