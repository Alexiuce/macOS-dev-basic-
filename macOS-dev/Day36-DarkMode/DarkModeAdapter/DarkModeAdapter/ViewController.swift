//
//  ViewController.swift
//  DarkModeAdapter
//
//  Created by Alexcai on 2018/11/17.
//  Copyright © 2018 dongjiu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var adaptedView: NSView!
    
    
    @IBOutlet weak var starImageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /** 设置view的appearance 效果 */
        /**
         NSAppearance.Name.darkAqua    : Dark 模式
         NSAppearance.Name.vibrantDark    : 仅可用于 Visual effect view
         NSAppearance.Name.accessibilityHighContrastDarkAqua
         NSAppearance.Name.accessibilityHighContrastVibrantLight
         */

        view.appearance? = NSAppearance.init(named: NSAppearance.Name.aqua)!
        print("\(String(describing: view.appearance?.name.rawValue))")
        
        
        /** 1. 颜色硬编码设置视图背景色 : 这种情况下,无论是light 或者dark 模式,颜色都是固定的值,不会根据主题进行适配 */
//        adaptedView.layer?.backgroundColor = NSColor.red.cgColor
        
        /** 2. 使用Asset 中的color 进行light /dark 之间的颜色适配: 切换light和dark时,需要重新开启应用 */
//        adaptedView.layer?.backgroundColor = NSColor(named: "Color")?.cgColor
        
        /** 3. 使用带有语意的NSColor */
//        adaptedView.layer?.backgroundColor = NSColor.labelColor.cgColor;
        adaptedView.layer?.backgroundColor = NSColor.controlBackgroundColor.cgColor;
        
        
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

