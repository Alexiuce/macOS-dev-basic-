//
//  ViewController.swift
//  CocoapodDemo
//
//  Created by Alexcai on 2017/8/26.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa
//import SnapKit


class ViewController: NSViewController {

    @IBOutlet weak var myLabel: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        myLabel.snp.makeConstraints { (make) in
//            make.bottom.equalTo(view).offset(-10)
//            make.right.equalTo(view).offset(-10)
//        }
        
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

