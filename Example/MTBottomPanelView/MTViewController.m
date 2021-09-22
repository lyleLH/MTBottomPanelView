//
//  MTViewController.m
//  MTBottomPanelView
//
//  Created by MTTGCC on 09/22/2021.
//  Copyright (c) 2021 MTTGCC. All rights reserved.
//

#import "MTViewController.h"
#import <MTBottomPanelView/MTBottomPanelViewModuleHeader.h>
@interface MTViewController ()

@property (nonatomic,strong)MTBottomPanelViewModule *panelViewModule;
@end

@implementation MTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor grayColor];
    MTBottomPanelViewModule * module = [[MTBottomPanelViewModule alloc] init];
    self.panelViewModule = module;
    [module showPannelInVc:self];
}

- (IBAction)statusChangButtons:(UIButton *)sender {
    NSInteger tag  = sender.tag -100;
    [self.panelViewModule userStatusChanged:[NSNumber numberWithInt:tag]];
}

@end
