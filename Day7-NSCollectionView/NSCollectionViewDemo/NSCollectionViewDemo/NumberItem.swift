//
//  NumberItem.swift
//  NSCollectionViewDemo
//
//  Created by Alexcai on 2017/8/16.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class NumberItem: NSCollectionViewItem {

    // 图片
    @IBOutlet weak var picture: NSImageView!
    // 文字
    
    @IBOutlet weak var titleLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
