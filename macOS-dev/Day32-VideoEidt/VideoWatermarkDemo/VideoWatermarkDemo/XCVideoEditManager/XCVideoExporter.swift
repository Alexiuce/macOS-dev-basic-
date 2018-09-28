//
//  XCVideoExporter.swift
//  VideoWatermarkDemo
//
//  Created by Alexcai on 2018/9/27.
//  Copyright © 2018年 dongjiu. All rights reserved.
//  视频导出类

import Foundation
import AVFoundation

class XCVideoExporter {
    
    fileprivate var exportSession: AVAssetExportSession
    
    init(videoAsset:AVAsset, watermark: XCVideoWatermark, output: String) {
        exportSession = AVAssetExportSession(asset: videoAsset, presetName: AVAssetExportPresetHEVCHighestQuality)!
        exportSession.outputFileType =  AVFileType.mp4
        exportSession.shouldOptimizeForNetworkUse = true
        exportSession.videoComposition = watermark.videoMutableComposition
        exportSession.outputURL = URL(fileURLWithPath: output)
    }
    
}


extension XCVideoExporter{
    func exportVideoToPath(completed: @escaping ()->()) {
        
        exportSession.exportAsynchronously {
            if self.exportSession.status == .completed {
                print("ok.....")
                completed()
            }else {
                print(self.exportSession.status.rawValue)
            }
        }
    }
}
