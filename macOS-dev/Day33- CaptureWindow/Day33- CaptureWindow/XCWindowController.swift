//
//  XCWindowController.swift
//  Day33- CaptureWindow
//
//  Created by Alexcai on 2018/10/3.
//  Copyright © 2018 dongjiu. All rights reserved.
//

import Cocoa

class XCWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        window?.level = .statusBar
//        guard let wFrame = NSScreen.main?.frame else { return }
//        window?.isMovableByWindowBackground = true
//        window?.setFrame(wFrame, display: true)
        window?.backgroundColor = NSColor.clear
    

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

}
