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
        let adjustTransform = videoTransformWithVideoDegree(degrees: editVideoComposition.videoDregree, nuturalSize: videoTrack.naturalSize)
        videoLayerInstruction.setTransform(adjustTransform, at: kCMTimeZero)
        
        videoInstruction.layerInstructions = [videoLayerInstruction]
        videoMutableComposition.instructions = [videoInstruction]
    }
    
    fileprivate func videoTransformWithVideoDegree(degrees: Int, nuturalSize: CGSize) -> CGAffineTransform{
        
        var transform = CGAffineTransform.identity
        if (degrees != 0) {
            var translateToCenter = CGAffineTransform.identity
            if (degrees == 90) {
                // 顺时针旋转90°
                translateToCenter = CGAffineTransform(translationX: nuturalSize.height, y: 0.0);
                transform = translateToCenter.rotated(by: CGFloat(Double.pi / 2))
            } else if(degrees == 180){
                // 顺时针旋转180°
                translateToCenter = CGAffineTransform(translationX: nuturalSize.width, y: nuturalSize.height)
                transform = translateToCenter.rotated(by: CGFloat(Double.pi))
                
            } else if(degrees == 270){
                // 顺时针旋转270°
                translateToCenter = CGAffineTransform(translationX: 0.0, y: nuturalSize.width)
                transform = translateToCenter.rotated(by: CGFloat(Double.pi * 1.5))
            }else if(degrees == -180){
                // 绕x轴旋转180 上下颠倒视频
                transform = CGAffineTransform.init(scaleX: 1.0, y: -1.0)
                transform = transform.translatedBy(x: 0, y: -nuturalSize.height)
            }
        }
        
        return transform
        
    }
    
}
