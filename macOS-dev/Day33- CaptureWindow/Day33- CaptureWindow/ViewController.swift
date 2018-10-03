//
//  ViewController.swift
//  Day33- CaptureWindow
//
//  Created by Alexcai on 2018/10/3.
//  Copyright © 2018 dongjiu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var label: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let screenSize = NSScreen.main?.frame.size else { return  }
        
//        view.layer?.backgroundColor = NSColor.red.cgColor
        view.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height-22.0)
        label.frame = view.bounds;
    }
}

