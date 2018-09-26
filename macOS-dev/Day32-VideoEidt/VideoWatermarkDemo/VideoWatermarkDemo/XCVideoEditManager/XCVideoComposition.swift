//
//  XCVideoComposition.swift
//  VideoWatermarkDemo
//
//  Created by Alexcai on 2018/9/26.
//  Copyright © 2018年 dongjiu. All rights reserved.
//

import Foundation
import AVFoundation

class XCVideoComposition {
    lazy var videoComposition = AVMutableComposition()
    
    fileprivate var videoUrlAsset: AVURLAsset
    
    init(videoAsset: AVURLAsset) {
        videoUrlAsset = videoAsset
    }
    
}
