//
//  MYCellView.swift
//  NSTableViewDemo
//
//  Created by Alexcai on 2017/8/17.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class MYCellView: NSView {

    @IBOutlet weak var pictureView: NSImageView!
    
    @IBOutlet weak var nameLabel: NSTextField!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
