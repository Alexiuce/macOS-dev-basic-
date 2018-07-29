//
//  ViewController.swift
//  NSViewControllerDemo
//
//  Created by Alexcai on 2017/8/29.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    @IBOutlet weak var containView: NSView!
    
    @IBOutlet var toolBar: NSToolbar!
    
    var vc1 : MYFirstController?
    var vc2 : NSViewController!
    var currentViewController : NSViewController!
    
    
    // 这个方法是在view被加载到内存的时候,控制器才会调用
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
//         vc1 = MYFirstController()
        // Do any additional setup after loading the view.
    }

    // 视图将要显示的时候,控制器会调用
    override func viewWillAppear() {
        super.viewWillAppear()
        print("视图将要显示")
        
    }
    
    // 这个是视图已经显示的时候,控制器才会调用
    override func viewDidAppear() {
        super.viewDidAppear()
         print("视图已经显示")
//         view.addSubview(vc1!.view)
        
        view.window?.toolbar = toolBar
        
    }

    // 视图将要消失的时候,控制器会调用这个方法
    override func viewWillDisappear() {
        super.viewWillDisappear()
         print("视图将要消失")
    }
    // 视图已经消失的时候,控制会调用这个方法
    override func viewDidDisappear() {
        super.viewDidDisappear()
         print("视图已经消失")
    }
    
    // 从VC2 过渡到VC1
    @IBAction func showFromV2ToV1(_ sender: Any) {
        if currentViewController != vc2 {return}
        
        transition(from: vc2, to: vc1!, options: .slideDown, completionHandler: {
            self.currentViewController = self.vc1
        })
        
    }
    // 从VC1 过渡VC2
    @IBAction func showFromV1ToV2(_ sender: Any) {
        if currentViewController != vc1! {return}
        transition(from: vc1!, to: vc2, options: .slideUp, completionHandler: {
            self.currentViewController = self.vc2
        })
    }
    
    
    // MARK: - present controller 
    
    @IBAction func presentController(_ sender: NSButton) {
        
        // 1. 以内嵌方式显示在当前窗口中
        // presentViewControllerAsSheet(vc1!)
        
        // 2. 以独立窗口的样式显示
//        presentViewControllerAsModalWindow(vc1!)
        
        // 3. 以Popover的方式显示
//        presentViewController(vc1!, asPopoverRelativeTo: view.bounds, of: view, preferredEdge: .maxX, behavior: .semitransient)
        // 4. 自定义控制器动画显示
        // 4.1 需要创建一个自定义的动画控制类(这个类来管理切换动画,并且,这个类要实现动画过渡协议方法)
        // 4.2 自定义的动画管理类,需要自己实现动画效果
        // 具体方法可参考示例代码

        presentViewController(vc1!, animator: CustomAnimation())
        
        
        
    }
    

}

extension ViewController{
    func setupUI() {
        print("视图加载到内存中")
        
        // 通过Storyboard加载控制器
        //        let sb = NSStoryboard(name: "Main", bundle: nil)
        //        let vc2 = sb.instantiateController(withIdentifier: "vc2") as! NSViewController
        
        // 使用控制器的Storyboard属性加载
        vc2 = storyboard?.instantiateController(withIdentifier: "vc2") as! NSViewController
        
        // 每个控制器都可以管理任意多个子控制器,通过使用addChildViewController方法添加被管理的子控制器
        // addChildViewController(<#T##childViewController: NSViewController##NSViewController#>)
        
        // 在10.10 版本以后,因为loadView会自动寻找跟控制器同名的xib文件,所以这里nibName可以传nil,bundle为nil的时候,默认就是main Bundle
        
        //vc1 = MYFirstController(nibName: nil, bundle: nil)
        vc1 = MYFirstController()
        currentViewController = vc1!
        
        addChildViewController(vc1!)
        addChildViewController(vc2)
        containView.addSubview(currentViewController.view)
        

    }
}


// MARK: - 控制器的常用属性
/**** 
 view : 控制器的视图属性,被控制器管理,并显示的内容容器
 storyboard : 获取控制器的Storyboard文件属性
 
 
 
 */

