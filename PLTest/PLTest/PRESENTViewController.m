//
//  PRESENTViewController.m
//  PLTest
//
//  Created by mac on 2017/12/9.
//  Copyright © 2017年 腾飞. All rights reserved.
//

#import "PRESENTViewController.h"
#import "UIDevice+TFDevice.h"
#import "AppDelegate.h"

@interface PRESENTViewController ()
@property(nonatomic,strong)UIButton *button;
@end

@implementation PRESENTViewController
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //感觉放到这里动画过度更自然点，如果此界面还有其他的push和Present的话就放到viewDidLoad吧！！！
//    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    //允许转成横屏
//    appDelegate.allowRotation = YES;
//    [UIDevice switchNewOrientation:UIInterfaceOrientationLandscapeRight];//调用转屏代码
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //允许转成横屏
    appDelegate.allowRotation = YES;
    //调用转屏代码
    [UIDevice switchNewOrientation:UIInterfaceOrientationLandscapeRight];

    _button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 125, 44)];
    
    [_button addTarget:self action:@selector(dismissController) forControlEvents:UIControlEventTouchUpInside];
    [_button setTitle:@"dismiss出去" forState:UIControlStateNormal];
    [self.view addSubview:_button];
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    _button.center = self.view.center;
}
- (void)dismissController{
    
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.allowRotation = NO;//关闭横屏仅允许竖屏
    //切换到竖屏
    [UIDevice switchNewOrientation:UIInterfaceOrientationPortrait];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

//MARK:状态栏的显示（横屏系统默认会隐藏的）
- (BOOL)prefersStatusBarHidden{
    return NO;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    NSLog(@"PRESENTViewController delloc");
}

@end
