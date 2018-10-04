//
//  ViewController.swift
//  GifDemo
//
//  Created by Alexcai on 2018/10/4.
//  Copyright © 2018 dongjiu. All rights reserved.
//

import Cocoa

import ImageIO

class ViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    
    lazy var imageArray = [NSImage]()
    
    var playIndex = 0
    /** 播放总时长 */
    var playTotalTime : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        readGifDataAndConfigImageView()
        
        // Do any additional setup after loading the view.
    }

  


    
    override func mouseDown(with event: NSEvent) {

        let animTimer = Timer(timeInterval: playTotalTime / Double(imageArray.count), target: self, selector: #selector(starGifAnimated), userInfo: nil, repeats: true)
        RunLoop.current.add(animTimer, forMode: RunLoop.Mode.common)
        
    }
}


extension ViewController{
    func readGifDataAndConfigImageView() {
        /** 1. 获取gif 资源的路径 */
        guard let gifPath = Bundle.main.pathForImageResource(NSImage.Name.init("timg.gif"))else{return}
        /** 2. 读取gif 图片资源元数据 */
        guard let gifData = NSData(contentsOfFile: gifPath) else {return}
        /** 3. 根据图片元数据生成 cfImageSourceRef (包含了gif资源的内部数据信息) */
        guard let imageSourceRef = CGImageSourceCreateWithData(gifData, nil) else {return}
        /** 4. 获取gif 中的图片个数 */
        let imageCount = CGImageSourceGetCount(imageSourceRef)
        /** 5. 创建数组,用于存放转换后的NSImage */
        for  i in 0 ..< imageCount {
            /** 6. 获取CGImage 资源  */
            guard let cgImageRef =  CGImageSourceCreateImageAtIndex(imageSourceRef, i, nil) else {continue}
            /** 7. 根据CGImage 创建NSImage  */
            let image =  NSImage(cgImage: cgImageRef, size: CGSize(width: cgImageRef.width, height: cgImageRef.height))
            /** 8. 将NSImage 添加的数组中 */
            imageArray.append(image)
            /** 9. 获取指定帧的属性信息 */
            guard let properties =  CGImageSourceCopyPropertiesAtIndex(imageSourceRef, i, nil) as? NSDictionary else {continue}
            /** 10. 获取指定帧的gif信息字典 */
            guard let gifDictInfo = properties[kCGImagePropertyGIFDictionary] as? NSDictionary else {continue}
            /** 11. 获取一帧的时长 */
            guard let duration = gifDictInfo[kCGImagePropertyGIFDelayTime] as? NSNumber else {continue}
            
            playTotalTime += duration.doubleValue
            
        }
        
        /** 显示某一帧图片 (此示例中显示为100 ,图片总数为104)*/
        imageView.image = imageArray[100];
        
    }
    
    
    @objc func starGifAnimated() {
        imageView.image = imageArray[playIndex]
        playIndex += 1
        if playIndex == imageArray.count {
            playIndex = 0
        }
    }
}

