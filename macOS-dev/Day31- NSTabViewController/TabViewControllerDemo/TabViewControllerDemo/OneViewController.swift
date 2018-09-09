//
//  OneViewController.swift
//  TabViewControllerDemo
//
//  Created by Alexcai on 2018/9/9.
//  Copyright © 2018年 dongjiu. All rights reserved.
//

import Cocoa

class OneViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        view.layer?.backgroundColor = NSColor.orange.cgColor
        self.preferredContentSize = view.frame.size
    }
    
}
