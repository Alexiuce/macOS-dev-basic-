//
//  XCMyCustomView.swift
//  DarkModeAdapter
//
//  Created by Alexcai on 2018/11/18.
//  Copyright © 2018 dongjiu. All rights reserved.
//

import Cocoa

class XCMyCustomView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        print("changed ...appearance.....")
        // Drawing code here.
    }
    override func updateLayer() {
        super.updateLayer()
        print("layer changed ...appearance.....")
        
    }
    override func layout() {
        super.layout()
        print("layout changed ...appearance.....")
    }
    override func updateConstraints() {
        super.updateConstraints()
        print("update constraint changed ...appearance.....")
        
    }
    
    
    
}
