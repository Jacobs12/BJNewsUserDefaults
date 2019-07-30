//
//  ViewController.m
//  BJNewsUserDefaults
//
//  Created by wolffy on 2019/7/30.
//  Copyright © 2019 新京报社. All rights reserved.
//

#import "ViewController.h"
#import "BJNewsUserDefaults.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",NSHomeDirectory());
    BJNewsUserDefaults * user = [BJNewsUserDefaults userDefaultsWithSuiteName:@"userName"];
    NSLog(@"%@",[user dictionary]);
}


@end
