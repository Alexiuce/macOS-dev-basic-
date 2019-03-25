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
}
- (void)viewDidAppear{
    [super viewDidAppear];
    /** 显示响应链信息: 此方法需要在控制器的视图显示后调用,若在viewDidLoad中调用,此时window对象尚未创建*/
    [self showResponderInfo];
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
    [self showResponderInfo];
}
#pragma mark - keyboard event
- (void)keyDown:(NSEvent *)event{
    NSLog(@"%s",__FUNCTION__);
}
@end
