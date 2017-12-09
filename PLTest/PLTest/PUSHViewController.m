//
//  PUSHViewController.m
//  PLTest
//
//  Created by mac on 2017/12/9.
//  Copyright © 2017年 腾飞. All rights reserved.
//

#import "PUSHViewController.h"
#import "UIDevice+TFDevice.h"
#import "AppDelegate.h"
#import "UIViewController+BackButtonHandler.h"
@interface PUSHViewController ()
@property(nonatomic,assign)BOOL backPortrait;
@end

@implementation PUSHViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //禁用侧滑手势方法
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //禁用侧滑手势方法
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //是否展示提示框
    _backPortrait = YES;
    
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //允许转成横屏
    appDelegate.allowRotation = YES;
    //调用转屏代码
    [UIDevice switchNewOrientation:UIInterfaceOrientationLandscapeRight];
}
//MARK:点击返回按钮（你也可以自定义一个返回按钮）
-(BOOL)navigationShouldPopOnBackButton {
    if(self.backPortrait) {
        //返回到竖屏的弹窗
        [self LandscapeToPortrait];
        return NO;
    }
    return YES;
}
- (void)LandscapeToPortrait{
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"提示" message:@"点击确定返回至上一个控制的竖屏状态" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *at1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *at2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        appDelegate.allowRotation = NO;//关闭横屏仅允许竖屏
        //切换到竖屏
        [UIDevice switchNewOrientation:UIInterfaceOrientationPortrait];
        
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [ac addAction:at1];
    [ac addAction:at2];
    
    [self presentViewController:ac animated:YES completion:nil];
    
}
- (void)dealloc{
    NSLog(@"PUSHViewController delloc");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//MARK:拦截侧滑返回
/*
- (void)willMoveToParentViewController:(UIViewController*)parent{
    [super willMoveToParentViewController:parent];
    NSLog(@"%s,%@",__FUNCTION__,parent);
    
}
- (void)didMoveToParentViewController:(UIViewController*)parent{
    [super didMoveToParentViewController:parent];
    NSLog(@"%s,%@",__FUNCTION__,parent);
    if(!parent){
        NSLog(@"页面pop成功了");
    }
}
*/
@end
