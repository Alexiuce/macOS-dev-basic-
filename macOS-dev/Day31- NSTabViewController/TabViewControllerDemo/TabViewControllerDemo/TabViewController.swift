//
//  ViewController.swift
//  TabViewControllerDemo
//
//  Created by Alexcai on 2018/9/9.
//  Copyright © 2018年 dongjiu. All rights reserved.
//

import Cocoa

class TabViewController: NSTabViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        NSSegmentedControl
        
//        let segmentControl = view.subviews.last
//        segmentControl?.removeFromSuperview()
        
//        print("\(view.self)")
//        let indexView = NSView(frame: NSMakeRect(0, 0, 100, 80))
//        indexView.wantsLayer = true
//        view.addSubview(indexView)
//        indexView.layer?.backgroundColor = NSColor.blue.cgColor
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

