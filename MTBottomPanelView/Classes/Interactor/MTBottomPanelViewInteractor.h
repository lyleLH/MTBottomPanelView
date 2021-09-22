//
//  MTBottomPanelViewInteractor.h
//  BottomPanelView
//
//  Created by Tom.Liu on 22/09/21.
//
//

#import <Foundation/Foundation.h>

#import "MTBottomPanelViewPresenter.h"
#import "MTBottomPanelViewDataManager.h"

@class MTBottomPanelViewPresenter;

/**
 Business logic for the BottomPanelView module.
 */
@interface MTBottomPanelViewInteractor : NSObject

@property (nonatomic, weak) MTBottomPanelViewPresenter *presenter;
@property (nonatomic, strong) MTBottomPanelViewDataManager *dataManager;

@end
