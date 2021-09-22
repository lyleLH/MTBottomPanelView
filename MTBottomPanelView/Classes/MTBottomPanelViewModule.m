//
//  MTBottomPanelViewModule.m
//  MTBottomPanelView
//
//  Created by 刘浩 on 9/22/21.
//

#import "MTBottomPanelViewModule.h"
#import "MTBottomPanelViewWireframe.h"
#import "MTBottomPanelViewPresenter.h"
@interface MTBottomPanelViewModule ()

@property (nonatomic,strong)MTBottomPanelViewWireframe * panelViewWireframe;

@end

@implementation MTBottomPanelViewModule

- (instancetype)init {
    if(self ==[super init]){
        MTBottomPanelViewWireframe * panelViewWireframe = [[MTBottomPanelViewWireframe alloc] init];
        self.panelViewWireframe = panelViewWireframe;
        MTBottomPanelViewPresenter * presenter = [[MTBottomPanelViewPresenter alloc] init];
        panelViewWireframe.presenter =  presenter;
        presenter.wireframe = panelViewWireframe;
        
    }
    return self;
}


- (void)showPannelInVc:(UIViewController *)vc {
    [self.panelViewWireframe presentSelfFromViewController:vc];
    [self.panelViewWireframe.presenter.userInterface updatePanelViewStatus:@"1" data:@"2"];
}


- (void)userStatusChanged:(id)status {
    [self.panelViewWireframe.presenter.userInterface updatePanelViewStatus:status data:@"2"];

}


@end
