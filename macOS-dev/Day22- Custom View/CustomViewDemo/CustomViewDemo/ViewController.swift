//
//  ViewController.swift
//  CustomViewDemo
//
//  Created by Alexcai on 2017/8/27.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var circleView: MYCircleView!
    @IBOutlet weak var myView: MYBackgroundView!
    override func viewDidLoad() {
        super.viewDidLoad()

        myView.backgroundColor = NSColor.orange
        
        circleView.colorRations = [0.2,0.4,0.1,0.15,0.15]
        circleView.circleColors = [NSColor.white,NSColor.black,NSColor.purple,NSColor.red,NSColor.yellow]
        circleView.circleLineWidth = 4
        circleView.circleLineColor = NSColor.green
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func changeMyViewBacugruondColor(_ sender: NSButton) {
        let red = Float(Float(arc4random_uniform(255)) / 255.0)
        let green = Float(Float(arc4random_uniform(255)) / 255.0)
        let blue = Float(Float(arc4random_uniform(255)) / 255.0)
        let randomColor = NSColor.init(colorLiteralRed: red, green: green, blue: blue, alpha: 1)
        
        
        myView.backgroundColor = randomColor
        
        
    }

}

