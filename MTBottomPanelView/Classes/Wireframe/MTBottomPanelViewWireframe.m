//
//  MTBottomPanelViewWireframe.m
//  BottomPanelView
//
//  Created by Tom.Liu on 22/09/21.
//
//

#import "MTBottomPanelViewWireframe.h"
//#import "MTBottomPanelViewViewController.h"
#import "MTBottomPanelViewRootView.h"
@interface MTBottomPanelViewWireframe ()

//@property (nonatomic, strong) MTBottomPanelViewViewController *viewController;
@property (nonatomic, strong) MTBottomPanelViewRootView *panelView;


@end

@implementation MTBottomPanelViewWireframe

- (void)presentSelfFromViewController:(UIViewController *)viewController andDelegate:(id)delegate andDatasource:(id)dataSource
{
    // save reference
//    self.viewController = [[MTBottomPanelViewViewController alloc] initWithNibName:@"MTBottomPanelViewViewController" bundle:nil];

    self.panelView = [[MTBottomPanelViewRootView alloc] init];
    
    
    // view <-> presenter
    self.presenter.userInterface = self.panelView;
    self.panelView.eventHandler = self.presenter;
    self.panelView.delegate = delegate;
    self.panelView.datasource = dataSource;
    // present controller
    // *** present self with RootViewController
    [viewController.view addSubview:self.panelView];
}

@end
