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
        
        let videoManager = XCVideoEidtManager(waterString: "WaterMark", waterPicture: "Group")
        
        let videoLocalUrl = URL(fileURLWithPath:"/Users/Alexcai/Desktop/video.mp4")
        
        videoManager.addWatermark(videoPath: videoLocalUrl)
        
    }

   


}

