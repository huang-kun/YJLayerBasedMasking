//
//  YJViewController.m
//  YJLayerBasedMasking
//
//  Created by huang-kun on 09/30/2016.
//  Copyright (c) 2016 huang-kun. All rights reserved.
//

#import "YJViewController.h"
#import "YJDemoView.h"

@implementation YJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *demoView = [[YJDemoView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [self.view addSubview:demoView];
}

@end
