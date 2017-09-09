//
//  ViewController.swift
//  AutoresizingDemo
//
//  Created by Alexcai on 2017/8/12.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

   
    @IBOutlet weak var blueView: NSBox!  // 蓝色视图
    
    @IBOutlet weak var redView: NSBox!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 1. 关闭autoresizing的约束
        blueView.translatesAutoresizingMaskIntoConstraints = false
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        // 2. 设置blueView的约束条件
        let blueViewCons = [
            // blueView 的顶部 距离父视图 顶部 有20个单位的距离
            blueView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            //blueView 的左边 距离父视图 左边 有20个单位的距离
            blueView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            // 设置blueView的高度
            blueView.heightAnchor.constraint(equalToConstant: 60),
            // 设置blueView右边
            blueView.rightAnchor.constraint(equalTo: view.centerXAnchor)
                             
            
        ]
        
        let redViewCons = [
            redView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            redView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            redView.heightAnchor.constraint(equalToConstant: 60),
            redView.leftAnchor.constraint(equalTo: view.centerXAnchor)
            
        ]
        
       // 3. 激活约束
        NSLayoutConstraint.activate(blueViewCons)
        
        NSLayoutConstraint.activate(redViewCons)
        
    
    
        // Do any additional setup after loading the view.
    }

   // Autolayout 小结
    
   /**
     1 . autoresizing :  
         用来处理子视图和父视图直接的位置和尺寸关系,处理子视图与子视图的位置和尺寸显得无能为力.
     
     2. autolayout: 
         用来处理子视图和父视图,以及子视图与其他子视图直接的尺寸和位置关系
     
     3. NSLayoutAnchor:
         用来简化代码编写autolayout约束的类
     
     4.NSLayoutAnchor 使用的时候,不必像iOS中对约束与添加到的视图有必然的关系
       只需要调用NSLayoutConstraint.activate(#这里就是需要添加约束的数组)
       在数组中,描述了具体那个view需要进行约束
     
     */


}

