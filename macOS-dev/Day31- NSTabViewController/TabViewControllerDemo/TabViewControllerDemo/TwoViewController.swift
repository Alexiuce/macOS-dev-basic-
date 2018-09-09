//
//  TwoViewController.swift
//  TabViewControllerDemo
//
//  Created by Alexcai on 2018/9/9.
//  Copyright © 2018年 dongjiu. All rights reserved.
//

import Cocoa

class TwoViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
         view.layer?.backgroundColor = NSColor.red.cgColor
         self.preferredContentSize = view.frame.size
    }
    
}
