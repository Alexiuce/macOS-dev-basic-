//
//  ViewController.swift
//  DarkModeAdapter
//
//  Created by Alexcai on 2018/11/17.
//  Copyright © 2018 dongjiu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var adaptedView: XCMyCustomView!
    
    @IBOutlet weak var starImageView: NSImageView!
    
    @IBOutlet weak var myLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /** 设置view的appearance 效果 */
        /**
         NSAppearance.Name.Aqua        : Light 默认设置
         NSAppearance.Name.darkAqua    : Dark 模式
         NSAppearance.Name.vibrantDark    : 仅可用于 Visual effect view
         NSAppearance.Name.accessibilityHighContrastDarkAqua     : 高对比的Dark 模式 (通常用于image)
         NSAppearance.Name.accessibilityHighContrastVibrantLight  : 高对比的毛玻璃 效果 ,用于visual effec view;
         */
        /** 此次对view 的appearance进行赋值是无效的,因为 window的生命周期方法尚未执行 (具体可参考基础课程视频或项目代码)*/
//        view.appearance? = NSAppearance.init(named: NSAppearance.Name.aqua)!
//        print("\(view.effectiveAppearance.name.rawValue)")
        
        
        /** 1. 颜色硬编码设置视图背景色 : 这种情况下,无论是light 或者dark 模式,颜色都是固定的值,不会根据主题进行适配 */
//        adaptedView.layer?.backgroundColor = NSColor.red.cgColor
        
        /** 2. 使用Asset 中的color 进行light /dark 之间的颜色适配: 切换light和dark时,需要重新开启应用 */
        adaptedView.layer?.backgroundColor = NSColor(named: "Color")?.cgColor
        
        /** 3. 使用带有语意的NSColor */
//        adaptedView.layer?.backgroundColor = NSColor.labelColor.cgColor;
//        adaptedView.layer?.backgroundColor = NSColor.controlBackgroundColor.cgColor;
        myLabel.textColor = NSColor.labelColor
        /** 可适配的系统颜色
         NSColor.systemRed
         NSColor.systemBlue
         NSColor.systemGray
         NSColor.systemPink
         */
        _ = NSImage(size: NSMakeSize(0, 0), flipped: true) { (rect) -> Bool in
        
        /** 返回值表示图片是否创建成功*/
        return true
        }
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

