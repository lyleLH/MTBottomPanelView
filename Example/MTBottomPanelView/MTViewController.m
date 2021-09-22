//
//  MTViewController.m
//  MTBottomPanelView
//
//  Created by MTTGCC on 09/22/2021.
//  Copyright (c) 2021 MTTGCC. All rights reserved.
//

#import "MTViewController.h"
#import <MTBottomPanelView/MTBottomPanelViewModuleHeader.h>
@interface MTViewController () <MTBottomPanelViewModuleDelegate,MTBottomPanelViewModuleDatasource>

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
    
    self.panelViewModule.delegate = self;
    self.panelViewModule.datasource = self;
    
    [module showPannelInVc:self];
}

- (IBAction)statusChangButtons:(UIButton *)sender {
    NSInteger tag  = sender.tag -101;
    [self.panelViewModule updateStatusinIndex:tag];
}


- (NSInteger)numberOfContentViewsInPanel:(UIView *)panelView  {
    return @[@260,@240,@300,@240,@180,@260].count;
}

- (UIView *)contentViewForPanelViewWithIndexPath:(NSIndexPath *)indexPath  {
    
    return  [MTBottomPanelViewChildView createPanelContenViewWithStatus:@1];
}

- (CGFloat)heightForPanelViewWithIndexPath:(NSIndexPath *)indexPath {
    NSNumber * currentHeight = @[@260,@240,@500,@240,@180,@260][indexPath.row];
    return currentHeight.intValue;
}

@end
