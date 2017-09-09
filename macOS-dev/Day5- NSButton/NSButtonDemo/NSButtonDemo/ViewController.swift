//
//  ViewController.swift
//  NSButtonDemo
//
//  Created by Alexcai on 2017/8/14.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let btn = NSButton(frame: NSMakeRect(100, 100, 150, 40))
        
        btn.title = "我是一个按钮"
        
        btn.alternateTitle = "我是开启状态"
        
        
        
        /** 设置按钮样式
         case momentaryLight
         
         case pushOnPushOff
         
         case toggle
         
         case `switch`
         
         case radio
         
         case momentaryChange
         
         case onOff
         
         case momentaryPushIn
         */
        btn.setButtonType(.switch)
        
            
        /**
         NSBezelStyleRounded           = 1,
         NSBezelStyleRegularSquare     = 2,
         NSBezelStyleDisclosure        = 5,
         NSBezelStyleShadowlessSquare  = 6,
         NSBezelStyleCircular          = 7,
         NSBezelStyleTexturedSquare    = 8,
         NSBezelStyleHelpButton        = 9,
         NSBezelStyleSmallSquare       = 10,
         NSBezelStyleTexturedRounded   = 11,
         NSBezelStyleRoundRect         = 12,
         NSBezelStyleRecessed          = 13,
         NSBezelStyleRoundedDisclosure = 14,
         NSBezelStyleInline NS_ENUM_AVAILABLE_MAC(10_7) = 15,
         
             */
        btn.bezelStyle = .regularSquare
        
        
//        btn.state = NSOnState // 按钮开启状态
        // NSOffState  // 按钮关闭状态
        
        
        // 设置普通状态的图片
        btn.image = NSImage(named: "tab-noti")
        
        // 设置开启状态的图片
        btn.alternateImage = NSImage(named: "tab-noti-active")
        
        /**
         
         // 设置按钮名称
          title: String
         
         // 设置按钮开启状态时的标题
          alternateTitle: String
         // 设置按钮图片
          image: NSImage?
         
        
         
         // 设置按钮开启状态的图片
          alternateImage: NSImage?
         // 设置按钮图片和文字的位置关系
         /**
          noImage     : 不显示图片
         
          imageOnly   : 仅显示图片
         
          imageLeft   : 图片在左边
         
          imageRight  : 图片在右边
         
          imageBelow  : 图片在下面
         
          imageAbove  : 图片在上面
         
          imageOverlaps : 图片文字混合显示
         
         @available(OSX 10.12, *)  :   图片正方向
         case imageLeading
         
         @available(OSX 10.12, *)  :   图片逆方向
         case imageTrailing
         */
          imagePosition: NSCellImagePosition
         
         
         // 设置图片缩放
         
         @available(OSX 10.5, *)
         open var imageScaling: NSImageScaling
         // 设置图片环绕标题
         @available(OSX 10.12, *)
         open var imageHugsTitle: Bool
         
         // 设置按钮类型的方法
          func setButtonType(_ type: NSButtonType)
         
         // 按钮的状态: on(alternateTitle) , off(normal),: 混合状态
          state: Int
         // 设置是否显示边框
          isBordered: Bool
         // 设置按钮是否透明
         isTransparent: Bool
         
       
         // 设置按钮的快捷键
          keyEquivalent: String
         // 设置快捷键的掩码
          keyEquivalentModifierMask: NSEventModifierFlags
         // 设置按钮高亮状态
          func highlight(_ flag: Bool)
         // 执行按钮的快捷键
         func performKeyEquivalent(with key: NSEvent) -> Bool
         // 设置按钮样式
         bezelStyle: NSBezelStyle
         
         
         // 设置按钮的类型
         func setButtonType(_ type: NSButtonType)
         */
        
        
        view.addSubview(btn)
        
        
        
        /** 按钮的事件监听
         Target - > action 方式来响应事件的
         */
        // 按钮事件的响应对象
        btn.target = self
        
        // 设置按钮响应方法
        btn.action = #selector(buttonClicked(_:))
        
        // 设置按钮的tag标记
        btn.tag = 10
        
    }

  
    // 定义方法,响应按钮操作
    func buttonClicked(_ sender : NSButton)  {
        print("按钮被点击了, 按钮的tag值是\(sender.tag)")
    }


}

