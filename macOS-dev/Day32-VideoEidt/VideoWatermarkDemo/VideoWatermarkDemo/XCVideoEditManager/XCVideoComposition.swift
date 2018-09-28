//
//  XCVideoComposition.swift
//  VideoWatermarkDemo
//
//  Created by Alexcai on 2018/9/26.
//  Copyright © 2018年 dongjiu. All rights reserved.
//  视频编辑构建类: 实现原始视频数据添加到可编辑的构建模版容器中,准备编辑

import Foundation
import AVFoundation

class XCVideoComposition {
    lazy var videoComposition = AVMutableComposition()
    var videoDregree = 0
    var videoRenderSize = CGSize.zero
    
    var videoPlayRange = kCMTimeRangeZero
    
    var videoTrack: AVAssetTrack?
    fileprivate var videoUrlAsset: AVURLAsset
    
    init(videoAsset: AVURLAsset) {
        videoUrlAsset = videoAsset
        videoPlayRange = CMTimeRangeMake(kCMTimeZero, videoAsset.duration)
        // 1.获取原始资源中的视频轨道数据
        guard let videoAssetTrack = videoAsset.tracks(withMediaType: .video).first else { return  }
        videoTrack = videoAssetTrack
        // 2.准备视频轨道容器
        guard let videoCompositionTrack = videoComposition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid) else{ return}
        let videoTimeRange = CMTimeRangeMake(kCMTimeZero, videoAsset.duration)
        // 3.添加到视频轨道容器中
        try? videoCompositionTrack.insertTimeRange(videoTimeRange, of: videoAssetTrack, at: kCMTimeZero)
        
        // 4.准备音频轨道容器
        guard let audioCompostionTrack = videoComposition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid) else { return  }
        // 5. 获取原始资源的音频轨道数据
        guard let audioAssetTrack = videoAsset.tracks(withMediaType: .audio).first else{return}
        // 6. 添加音频轨道数据到音频轨道容器
        try? audioCompostionTrack.insertTimeRange(videoTimeRange, of: audioAssetTrack, at: kCMTimeZero)
        // 7. 设置视频方向
        videoDregree = degreeFromVideoAssetTrack(videoAsset: videoAssetTrack)
        let isLandscape = videoDregree == 90 || videoDregree == 270
        videoRenderSize = isLandscape ? CGSize(width: videoAssetTrack.naturalSize.height, height: videoAssetTrack.naturalSize.width) : videoAssetTrack.naturalSize
        
    }
    
}

extension XCVideoComposition{
    fileprivate func degreeFromVideoAssetTrack(videoAsset: AVAssetTrack) -> Int{
        var degress = 0
        let t = videoAsset.preferredTransform
        
        if(t.a == 0 && t.b == 1.0 && t.c == -1.0 && t.d == 0){
            // Portrait
            degress = 90
        } else if(t.a == 0 && t.b == -1.0 && t.c == 1.0 && t.d == 0){
            // PortraitUpsideDown
            degress = 270
        } else if(t.a == 1.0 && t.b == 0 && t.c == 0 && t.d == 1.0){
            // LandscapeRight
            degress = 0
        } else if(t.a == -1.0 && t.b == 0 && t.c == 0 && t.d == -1.0){
            // LandscapeLeft
            degress = 180
        } else if(t.a == -1.0 && t.b == 0 && t.c == 0 && t.d == -1.0){
            // LandscapeLeft
            degress = 180
        } else if(t.a == 1.0 && t.b == 0 && t.c == 0 && t.d == -1.0){
            // x-axis
            degress = -180
        }
        return degress
        
    }
    
    
}
