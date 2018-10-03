//
//  ViewController.swift
//  Day33- CaptureWindow
//
//  Created by Alexcai on 2018/10/3.
//  Copyright © 2018 dongjiu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let screenFrame = NSScreen.main?.frame else { return  }
       
        guard let imageRef =  CGWindowListCreateImage(screenFrame, CGWindowListOption.optionOnScreenOnly, kCGNullWindowID, CGWindowImageOption.bestResolution) else { return  }
        let image = NSImage(cgImage: imageRef, size: <#T##NSSize#>)
        
    
        
        // Do any additional setup after loading the view.
    }



}

