//
//  AddController.swift
//  Demo
//
//  Created by Alexcai on 2017/10/6.
//  Copyright © 2017年 Daredake. All rights reserved.
//

import Cocoa

class AddController: NSViewController {

    
    @IBOutlet weak var matchTextField: NSTextField!         // 赛事
    @IBOutlet weak var recordTextField: NSTextField!        // 记录
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    // 点击OK按钮
    @IBAction func clickFinished(_ sender: NSButton) {
        // 1. 校验赛事和记录逻辑...根据你的实际情景来处理
        
        // 2. 获取输入数据,封装为模型对象
        let match = matchTextField.stringValue
        let record = recordTextField.stringValue
        let score = ScoreModel(match, record: record)
        
        // 3. 使用通知方式传递数据
        NotificationCenter.default.post(name: Notification.Name("AddNewScore"), object: score)
        
        // 4.关闭窗口
        view.window?.close()
        
    }
    
}
