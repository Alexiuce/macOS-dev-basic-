//
//  ViewController.swift
//  CAAinamationDemo
//
//  Created by Alexcai on 2018/10/4.
//  Copyright © 2018 dongjiu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var presentAnimationView: NSView!
    
    /** 动画展示layer */
    lazy var animLayer : CALayer = {
        let layer = CALayer()
        layer.backgroundColor = NSColor.yellow.cgColor
        layer.bounds = CGRect(x: 0, y: 0, width: 50, height: 20)
        layer.anchorPoint = CGPoint.zero
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentAnimationView.layer?.backgroundColor = NSColor.gray.cgColor
        presentAnimationView.layer?.addSublayer(animLayer)
        // Do any additional setup after loading the view.
        strokeEndAnmi()
        
    }

    override func mouseDown(with event: NSEvent) {
        
    }
}


extension ViewController{
    func moveAnimDemo()  {
        
       
        
        let moveAnim = CABasicAnimation(keyPath: "position.x")
        
        moveAnim.fromValue = 0
        moveAnim.toValue = 100
        moveAnim.duration = 2
        
        moveAnim.fillMode = .forwards
        moveAnim.isRemovedOnCompletion = false
        
        animLayer.add(moveAnim, forKey: nil)
        
        
    }
    
    func strokeEndAnmi()  {
        
    
        let shaperLayer = CAShapeLayer()
        shaperLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        shaperLayer.backgroundColor = NSColor.orange.cgColor
        
        view.layer?.addSublayer(shaperLayer)
        
        let shapePath = NSBezierPath(rect: shaperLayer.bounds)
        shaperLayer.path = shapePath.cgPath
        
        
//        let moveAnim = CABasicAnimation(keyPath: "strokeEnd")
//
//        moveAnim.fromValue = 0
//        moveAnim.toValue = 0.5
//        moveAnim.duration = 2
//
//        moveAnim.fillMode = .forwards
//        moveAnim.isRemovedOnCompletion = false
//
//        shaperLayer.add(moveAnim, forKey: nil)
        
    }
}

