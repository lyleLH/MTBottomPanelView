//
//  MTBottomPanelViewWireframe.h
//  BottomPanelView
//
//  Created by Tom.Liu on 22/09/21.
//
//

#import <Foundation/Foundation.h>

//#import "RootWireframe.h"

#import "MTBottomPanelViewModule.h"

#import "MTBottomPanelViewPresenter.h"

@class MTBottomPanelViewPresenter;

/**
 Module wireframe for the BottomPanelView module.
 */
@interface MTBottomPanelViewWireframe : NSObject

@property (nonatomic, strong) MTBottomPanelViewModule *rootWireframe;
@property (nonatomic, strong) MTBottomPanelViewPresenter *presenter;

// initialization
- (void)presentSelfFromViewController:(UIViewController *)viewController andDelegate:(id)delegate andDatasource:(id)dataSource ;

@end
