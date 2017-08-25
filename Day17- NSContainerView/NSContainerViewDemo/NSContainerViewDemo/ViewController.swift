//
//  ViewController.swift
//  NSContainerViewDemo
//
//  Created by Alexcai on 2017/8/24.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var v1 : NSViewController?
    var v2 : NSViewController?
    
    var currentVC  : NSViewController?
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var containerView: NSView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化属性
        
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        v1 = storyboard.instantiateController(withIdentifier: "v1") as? NSViewController
        v2 = storyboard.instantiateController(withIdentifier: "v2") as? NSViewController
        
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func showView1(_ sender: Any) {
        showController(v1!)
        
    }

    @IBAction func showView2(_ sender: Any) {
        showController(v2!)
    }

}

extension ViewController {
    
    // 自定义切换控制view 的方法
    func showController(_ vc : NSViewController) {
        if  currentVC != nil {
            currentVC?.view.removeFromSuperview()
            currentVC?.removeFromParentViewController()
        }
        
        addChildViewController(vc)
        vc.view.frame = containerView.bounds
        containerView.addSubview(vc.view)
        currentVC = vc

    }

}

