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
    

    }
    
    override func tabView(_ tabView: NSTabView, didSelect tabViewItem: NSTabViewItem?) {
        super.tabView(tabView, didSelect: tabViewItem)
        
        guard let itemView = tabViewItem?.view,
            let window = view.window
            else {return}
        
        
        let oldFrame = window.frame
        
        let newViewSize = itemView.fittingSize
        
        var newFrame = window.frameRect(forContentRect: NSMakeRect(oldFrame.origin.x, oldFrame.origin.y, newViewSize.width, newViewSize.height))
        
        let newY = oldFrame.origin.y - ( newFrame.size.height - oldFrame.size.height)
        newFrame.origin = NSMakePoint(oldFrame.origin.x, newY)
        
        NSAnimationContext.runAnimationGroup({ (context) in
            window.animator().setFrame(newFrame, display: window.isVisible)
        }, completionHandler: nil)
        
    }
}

