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
        
        // 1.准备视频轨道容器
        guard let videoCompositionTrack = videoComposition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid) else{ return}
        // 2.获取原始资源中的视频轨道数据
        guard let videoAssetTrack = videoAsset.tracks(withMediaType: .video).first else { return  }
        let videoTimeRange = CMTimeRangeMake(kCMTimeZero, videoAsset.duration)
        // 3.添加到视频轨道容器中
        try? videoCompositionTrack.insertTimeRange(videoTimeRange, of: videoAssetTrack, at: kCMTimeZero)
        
        // 4.准备音频轨道容器
        guard let audioCompostionTrack = videoComposition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid) else { return  }
        // 5. 获取原始资源的音频轨道数据
        guard let audioAssetTrack = videoAsset.tracks(withMediaType: .audio).first else{return}
        // 6. 添加音频轨道数据到音频轨道容器
        try? audioCompostionTrack.insertTimeRange(videoTimeRange, of: audioAssetTrack, at: kCMTimeZero)
    }
    
}
