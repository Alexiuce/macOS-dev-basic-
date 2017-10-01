//
//  ViewController.swift
//  NSImageViewDemo
//
//  Created by Alexcai on 2017/8/15.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    @IBOutlet weak var imgView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        imgView.imageScaling = .scaleNone;
        
        
        // 1. 创建NSImageView
        let imgRect = NSMakeRect(100, 50, 200, 200)
        let imageView = NSImageView(frame: imgRect)
        // 2. 添加到父视图中
        view.addSubview(imageView)
        
        // 3. 设置常用属性
        imageView.image = NSImage(named: "apple")   // 设置显示图片
        imageView.imageScaling = .scaleNone
        imageView.imageAlignment = .alignCenter
//        imgView.isEditable = true    // 设置是支持编辑功能
        
        
        // 4. 代码创建的NSImageVie对象,animtes属性默认值是true, 如果是使用Storyboard 拖拽的控件,animates的默认是fales
        
    
        
        // 5 . 处理图片的事件响应 : 苹果不推荐使用NSImageView来响应用户操作,建议使用NSButton
        
        
        // 6. 仅当图片可编辑时,用户拖拽图片到NSImageView上时,才会执行响应
        imageView.target = self
        
        imageView.action = #selector(clickedImageView)
        
        
        
        /**
         NSImageFrameNone = 0,    // 无边框
         NSImageFramePhoto,       // 相框(黑色的边线,以及阴影背景)
         NSImageFrameGrayBezel,   // 灰色
         NSImageFrameGroove,      // 雕刻槽边框
         NSImageFrameButton       // 仿按钮效果边框
         */
//        imgView.imageFrameStyle =  .groove
        
        
        /** 设置支持显示动画图片*/
//        imgView.animates = false
        
        
        /** NSImageView 的常用属性
         
         
          image: NSImage?   // 需要显示图片对象
         
          imageAlignment: NSImageAlignment     // 图片的对齐方式(只有图片显示不完全时才有效)
         
          imageScaling: NSImageScaling      // 图片的缩放
         
          imageFrameStyle: NSImageFrameStyle   // 图片的边框类型
         
          isEditable: Bool                  // 图片是否支持编辑功能(如果支持编辑,图片可以复制,剪切,拖拽等)
         
         
          animates: Bool   // 是否支持动画图片(比如gif动图显示,如果支持,就会显示动画的图片)
         
         
          allowsCutCopyPaste: Bool    // 是否运行用户进行剪切,拷贝以及粘贴功能
         
         */
        
        
        
        // 图片响应方式1: 添加一个按钮在图片上面,使用按钮来响应用户操作
        
        // 图片响应方式2: 使用手势识别
//        let clickGes = NSClickGestureRecognizer(target: self, action: #selector(clickedImageView))
//        imgView.addGestureRecognizer(clickGes)
        
        // 图片响应方式3 : 自定NSImageView ,重写方法mouseDown
        
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func clickButton(_ sender: NSButton) {
        clickedImageView()
        
    }
    
    func clickedImageView()  {
        print("操作了ImageView")
    }
}

