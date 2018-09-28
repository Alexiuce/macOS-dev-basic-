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
        
        guard let videoPath = Bundle.main.path(forResource: "video.mp4", ofType: nil, inDirectory: nil) else{return}
        
        let videoLocalUrl = URL(fileURLWithPath:videoPath)
       
        videoManager.addWatermark(videoPath: videoLocalUrl)
        
    }

   


}

