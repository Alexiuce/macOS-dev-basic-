//
//  ViewController.m
//  ResponderChainDemo
//
//  Created by Alexcai on 2019/3/25.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "ViewController.h"
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /** 通过NSEvent 添加本地事件监听 来实现监听键盘事件 (这种方法完全可以实现键盘键盘,但对于细致理解响应链的原理不利,为了学习响应链的事件传递过程,本项目中不推荐采用此方式) */
//    [NSEvent addLocalMonitorForEventsMatchingMask:NSEventMaskKeyDown handler:^NSEvent * _Nullable(NSEvent * _Nonnull event) {
//        NSLog(@"local monitor for key down~");
//        return event;
//    }];
    
}
- (void)viewDidAppear{
    [super viewDidAppear];
    /** 显示响应链信息: 此方法需要在控制器的视图显示后调用,若在viewDidLoad中调用,此时window对象尚未创建*/
    [self showResponderInfo];
    /** 查看窗口的第一响应者对象 */
    NSLog(@"first responder = %@",NSApp.keyWindow.firstResponder);
//    NSResponder *responder = NSApp.keyWindow.nextResponder;
//    [NSApp.keyWindow setNextResponder:self];
    /** 设置响应者时,如果没有下面这行代码,会有什么问题呢?? (供思考)*/
//    [self setNextResponder:responder];
    
}
- (void)showResponderInfo{
    NSResponder *responder = self.view.nextResponder;
    int i = 0;
    while (responder) {
        NSLog(@"%d responder - %@",i,responder);
        i++;
        responder = responder.nextResponder;
    }
}

#pragma mark - mouse event
- (void)mouseDown:(NSEvent *)event{
    NSLog(@"%s",__FUNCTION__);
     NSLog(@"first responder = %@",NSApp.keyWindow.firstResponder);
    [self showResponderInfo];
}
#pragma mark - keyboard event
- (void)keyDown:(NSEvent *)event{
    NSLog(@"%s",__FUNCTION__);
}
@end
