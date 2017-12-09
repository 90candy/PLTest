//
//  ViewController.m
//  PLTest
//
//  Created by mac on 2017/12/9.
//  Copyright © 2017年 腾飞. All rights reserved.
//

#import "ViewController.h"
#import "PUSHViewController.h"
#import "PRESENTViewController.h"
#import "UIDevice+TFDevice.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)clickPushBtn:(UIButton *)sender {
    PUSHViewController *push = [[PUSHViewController alloc]init];
    push.view.backgroundColor = [UIColor blueColor];
    [self.navigationController pushViewController:push animated:YES];
}

- (IBAction)clickPresentBtn:(UIButton *)sender {
    PRESENTViewController *present = [[PRESENTViewController alloc]init];
    present.view.backgroundColor = [UIColor redColor];
    [self presentViewController:present animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
