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
    }

    override func mouseDown(with event: NSEvent) {
        moveAnimDemo()
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
        
    
        let moveAnim = CABasicAnimation(keyPath: "strokeEnd")
        
        moveAnim.fromValue = 0
        moveAnim.toValue = 100
        moveAnim.duration = 2
        
        moveAnim.fillMode = .forwards
        moveAnim.isRemovedOnCompletion = false
        
        animLayer.add(moveAnim, forKey: nil)
    }
}
