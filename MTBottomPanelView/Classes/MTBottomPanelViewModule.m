//
//  MTBottomPanelViewModule.m
//  MTBottomPanelView
//
//  Created by 刘浩 on 9/22/21.
//

#import "MTBottomPanelViewModule.h"
#import "MTBottomPanelViewWireframe.h"
#import "MTBottomPanelViewPresenter.h"
#import "MTBottomPanelViewChildView.h"

@interface MTBottomPanelViewModule () <MTBottomPanelViewModuleDelegate>

@property (nonatomic,strong)MTBottomPanelViewWireframe * panelViewWireframe;

@end

@implementation MTBottomPanelViewModule

- (instancetype)init {
    if(self ==[super init]){
        MTBottomPanelViewWireframe * panelViewWireframe = [[MTBottomPanelViewWireframe alloc] init];
        self.panelViewWireframe = panelViewWireframe;
        panelViewWireframe.rootWireframe = self;
        MTBottomPanelViewPresenter * presenter = [[MTBottomPanelViewPresenter alloc] init];
        panelViewWireframe.presenter =  presenter;
        presenter.wireframe = panelViewWireframe;
    }
    return self;
}


- (void)showPannelInVc:(UIViewController *)vc {
    [self.panelViewWireframe presentSelfFromViewController:vc andDelegate:self.delegate andDatasource:self.datasource];
    [self.panelViewWireframe.presenter.userInterface updatePanelViewInIndexPath:[NSIndexPath indexPathForRow:0 inSection:0 ] data:@"2"];
    
}


- (void)updateStatusinIndex:(NSInteger)index {
    [self.panelViewWireframe.presenter.userInterface updatePanelViewInIndexPath:[NSIndexPath indexPathForRow:index   inSection:0] data:@"2"];

}



@end
