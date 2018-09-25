//
//  ViewController.swift
//  VideoWatermarkDemo
//
//  Created by Alexcai on 2018/9/25.
//  Copyright © 2018年 dongjiu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let videoManager = XCVideoEidtManager(waterString: "WaterMark", waterPicture: "mark")
        
    }

   


}

