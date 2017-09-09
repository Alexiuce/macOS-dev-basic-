//
//  ViewController.swift
//  CocoaBindingDemo
//
//  Created by Alexcai on 2017/8/28.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var dataLabel:NSTextField!
    
    /** Swift 中,默认情况下,成员属性不支持KVO,如果希望该属性可以进行键值观察(KVO),需要添加关键字dynamic进行声明
     */
    dynamic var studentCount = 10

//    @IBOutlet weak var myLabel: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

 
//    @IBAction func changeSlider(_ sender: NSSlider) {
//        
//        myLabel.stringValue = "\(sender.intValue)"
//        
//    }
    @IBAction func changeCount(_ sender: Any) {
        
        studentCount = Int(arc4random_uniform(100))
        
    }


    @IBAction func showDate(_ sender: Any) {
        dataLabel.stringValue = "\(studentCount)"
    }
}

