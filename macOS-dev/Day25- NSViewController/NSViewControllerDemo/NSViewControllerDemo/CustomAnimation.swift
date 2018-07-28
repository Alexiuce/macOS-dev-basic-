//
//  CustomAnimation.swift
//  NSViewControllerDemo
//
//  Created by Alexcai on 2017/8/29.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class CustomAnimation: NSObject {

}

extension CustomAnimation : NSViewControllerPresentationAnimator{
    // 自定义实现present动画方法
    func animatePresentation(of viewController: NSViewController, from fromViewController: NSViewController) {
        // 1. 获取容器view
        let containerView = fromViewController.view
        // 2. 计算最终显示的frame
        let finalFrame = NSInsetRect(containerView.bounds, 50, 50)
        // 3. 需要显示的view
        let modalView = viewController.view
        
        modalView.frame = finalFrame
        modalView.setFrameOrigin(NSMakePoint(finalFrame.origin.x, finalFrame.origin.y - 100))
        
        containerView.addSubview(modalView)
        
        NSAnimationContext.runAnimationGroup({ (animationContext) in
            animationContext.duration = 0.5
            modalView.animator().frame = finalFrame
            
        }, completionHandler: nil)
        
    }
    
    
    // 自定义实现dismiss动画方法
    func animateDismissal(of viewController: NSViewController, from fromViewController: NSViewController) {
        // 1. 获取开始动画的frame
        let startFrame = viewController.view.frame
        // 2. 执行动画
        
        NSAnimationContext.runAnimationGroup({ (animationContext) in
            animationContext.duration = 0.5
            viewController.view.animator().setFrameOrigin(NSMakePoint(startFrame.origin.x, startFrame.origin.y - fromViewController.view.bounds.size.height))
        }) { 
            viewController.view.removeFromSuperview()
        }
    }

}
