//
//  XCVideoWatermark.swift
//  VideoWatermarkDemo
//
//  Created by Alexcai on 2018/9/26.
//  Copyright © 2018年 dongjiu. All rights reserved.
//  添加水印类: 实现添加水印到视频

import Foundation
import AVFoundation
import AppKit


class XCVideoWatermark {
    
    fileprivate var editVideoComposition: XCVideoComposition
    
    lazy var videoMutableComposition = AVMutableVideoComposition()
    
    
    init(videoComposition: XCVideoComposition) {
        editVideoComposition = videoComposition
        videoMutableComposition.frameDuration = CMTime(seconds: 1, preferredTimescale: 30)
        videoMutableComposition.renderSize = videoComposition.videoRenderSize
    }
    
}



extension XCVideoWatermark{
    
    /// 添加图片水印
    ///
    /// - Parameter imageName: 图片名称
    func addImageWatermark(imageName: String) {
        guard let image = NSImage(named:NSImage.Name(rawValue: imageName)) else { return  }
        // 1. 创建水印图片layer
        var imageRect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        let imageLayer = CALayer()
        imageLayer.contents = image.cgImage(forProposedRect: &imageRect, context: nil, hints: nil)
        imageLayer.bounds = imageRect
        
        let width = videoMutableComposition.renderSize.width
        let height = videoMutableComposition.renderSize.height
        let parentLayer = CALayer()
        parentLayer.bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let videoLayer = CALayer()
        videoLayer.bounds = parentLayer.bounds
        parentLayer.addSublayer(videoLayer)
        parentLayer.addSublayer(imageLayer)
        parentLayer.isGeometryFlipped = true
        // 2. 添加水印
        videoMutableComposition.animationTool = AVVideoCompositionCoreAnimationTool.init(postProcessingAsVideoLayer: videoLayer, in: parentLayer)
        
        // 3. 设置合成水印视频
        let videoInstruction = AVMutableVideoCompositionInstruction()
        videoInstruction.timeRange = editVideoComposition.videoPlayRange
        
        guard let videoTrack = editVideoComposition.videoTrack else { return  }
        let videoLayerInstruction = AVMutableVideoCompositionLayerInstruction(assetTrack: videoTrack)
        
        videoInstruction.layerInstructions = [videoLayerInstruction]
        videoMutableComposition.instructions = [videoInstruction]
        
    
    }
    
}
