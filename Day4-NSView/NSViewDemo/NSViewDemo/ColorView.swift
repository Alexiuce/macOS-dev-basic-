//
//  ColorView.swift
//  NSViewDemo
//
//  Created by Alexcai on 2017/8/13.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ColorView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // 设置颜色填充
        NSColor.orange.set()
        
        NSBezierPath.fill(dirtyRect)
    }
    
}
