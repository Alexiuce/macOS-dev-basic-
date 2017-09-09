//
//  ClickImageView.swift
//  NSImageViewDemo
//
//  Created by Alexcai on 2017/8/15.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ClickImageView: NSImageView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    override func mouseDown(with event: NSEvent) {
        if self.action == nil, self.target == nil {return}
        
        NSApp.sendAction(self.action!, to: self.target!, from: self)
    }
    
}
