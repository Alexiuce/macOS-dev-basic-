//
//  ViewController.swift
//  NSArrayControllerDemo
//
//  Created by Alexcai on 2017/8/30.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var students : [Student] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}



// MARK: - NSArrayController 绑定步骤

/**
 
 1. 必须让NSArrayController 知道要管理那个数组的数据
    通过在把Bind页面中设置content Array 来确定
 
 2 .必须让NSArrayController 知道被管理的数组中,数据是属于哪个类
    在NSArrayController 的属性面板(注意不是绑定面板)中设置class name 为数组中对象所属于的类
 
    * 类名必须使用包含有命名空间的前缀,否则会报找不到这个类的错误信息(重点!!!)
      通常是"项目名称."+"类的名称"
 
 */







