//
//  MYFirstController.swift
//  NSViewControllerDemo
//
//  Created by Alexcai on 2017/8/29.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class MYFirstController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    @IBAction func dismiss(_ sender: Any) {
       dismissViewController(self)
    
    }
    
}
