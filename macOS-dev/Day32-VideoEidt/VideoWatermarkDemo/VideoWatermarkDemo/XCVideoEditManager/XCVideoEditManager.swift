//
//  XCVideoEditManager.swift
//  VideoWatermarkDemo
//
//  Created by Alexcai on 2018/9/25.
//  Copyright © 2018年 dongjiu. All rights reserved.
//

import Foundation
import AVFoundation

class XCVideoEidtManager {
    
    /// 水印文字
    fileprivate var waterText: String
    
    /// 水印图片
    fileprivate var waterImage: String
    
    init(waterString: String, waterPicture: String) {
        waterText = waterString
        waterImage = waterPicture
    }
    
}

extension XCVideoEidtManager{
    func addWatermark(videoPath:URL) {
        let videoAsset = AVURLAsset(url: videoPath)
        let videoComposition = XCVideoComposition(videoAsset: videoAsset)
        print("\(videoComposition)")
        
        let videoWatermark = XCVideoWatermark(videoComposition: videoComposition)
        videoWatermark.addImageWatermark(imageName: waterImage)
        
        let videoExporter = XCVideoExporter(videoAsset: videoComposition.videoComposition, watermark: videoWatermark, output: "/Users/Alexcai/Desktop/video/abc.mov")
        videoExporter.exportVideoToPath {
            print("video finished")
        }
        
       
        
    
        
    }
}
