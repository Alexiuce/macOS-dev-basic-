//
//  MouseDrawView.swift
//  Day33- CaptureWindow
//
//  Created by Alexcai on 2018/10/3.
//  Copyright © 2018 dongjiu. All rights reserved.
//

import Cocoa

class MouseDrawView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

       
        // Drawing code here.
    }
}


extension MouseDrawView{
    override func mouseDown(with event: NSEvent) {
        super.mouseDown(with: event)
        print("mouse down")
    }
}
