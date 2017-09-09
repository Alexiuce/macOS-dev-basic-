//
//  ViewController.swift
//  NSSlierDemo
//
//  Created by Alexcai on 2017/8/25.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    
    var popover : NSPopover?

    @IBOutlet weak var myLabel: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        
        popover = NSPopover()
        
        popover?.contentViewController = storyboard.instantiateController(withIdentifier: "pop") as? NSViewController
        
        popover?.behavior = .semitransient
        
        
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func changedSlider(_ sender: NSSlider) {
        // 1. 获取slider当前的值
        let currentValue = sender.floatValue
        myLabel.stringValue = "\(currentValue)"
       
        
        // 计算popover需要显示的矩形位置
        
        let allLength = sender.bounds.size.width
        
        let ratio = CGFloat((sender.doubleValue - sender.minValue) / (sender.maxValue - sender.minValue))
        
        let leftWidth = allLength * ratio
        
        let targetRect = NSMakeRect(leftWidth, 0, 10, 10)
        

        
        // 2. 显示popover
        
        
        
        popover?.show(relativeTo:targetRect, of: sender, preferredEdge: .minY)
        
        
        
    }

}

