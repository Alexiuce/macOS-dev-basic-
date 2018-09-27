//
//  XCVideoWatermark.swift
//  VideoWatermarkDemo
//
//  Created by Alexcai on 2018/9/26.
//  Copyright © 2018年 dongjiu. All rights reserved.
//  添加水印类: 实现添加水印到视频

import Foundation
import AVFoundation


class XCVideoWatermark {
    
    fileprivate var editVideoComposition: XCVideoComposition
    
    init(videoComposition: XCVideoComposition) {
        editVideoComposition = videoComposition
    }
    
}



extension XCVideoWatermark{
    
    /// 添加图片水印
    ///
    /// - Parameter imageName: 图片名称
    func addImageWatermark(imageName: String) {
        
    }
    
}
