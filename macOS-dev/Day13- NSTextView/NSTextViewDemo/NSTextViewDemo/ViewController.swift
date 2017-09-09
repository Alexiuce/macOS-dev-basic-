//
//  ViewController.swift
//  NSTextViewDemo
//
//  Created by Alexcai on 2017/8/20.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // 1. 关闭直引号输入时自动替换为弯引号
        textView.isAutomaticQuoteSubstitutionEnabled = false
        
       // 2. 设置TextVeiw的字体
        textView.font = NSFont.systemFont(ofSize: 20)
       // 3. 设置TextView的文字颜色
        textView.textColor = NSColor.purple
        
        // 4. 设置TextView的属性文字()
        
        let attributeText = NSMutableAttributedString(string: "Apple Cocoa TextView")
        attributeText.addAttributes([NSForegroundColorAttributeName:NSColor.orange], range: NSMakeRange(0, 5))
        textView.textStorage?.setAttributedString(attributeText)
       
        // 5. 设置TextView的背景色
        textView.backgroundColor = NSColor.red
        // 6. 设置文字的内边距
        // width : 设置文字左右的内边距
        // height: 设置文字上下的内边距
        textView.textContainerInset = NSSize(width: 30, height: 0)
        
        
        
        // 7. 设置代理,监听文本变化
        textView.delegate = self 
       
        
        // Do any additional setup after loading the view.
    }
}

extension ViewController : NSTextViewDelegate{
    //  文本内容改变,调用这个代理方法
    func textDidChange(_ notification: Notification) {
        Swift.print("\(String(describing: textView.string))")
    }
    
    // 监听指定按键(与NSTextField相同)
    func textView(_ textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
        
        
        // insertNewline:  回车键
        // deleteBackward: 回退键
        // insertTab:      tab键
        //moveUp:          上方向键
       // moveDown:        下方向键
       // moveLeft:        左方向键
       // moveRight:       右方向键

        print("\(commandSelector)")
        if commandSelector.description == "insertNewline:" {
           print("按了回车键")
            return true  // 表示代理以及处理键盘事件,不需要系统再进行处理
        }
        // 如果返回false ,则系统自动处理,如果返回true,则系统不做处理
        return false
    }
    
    
}

