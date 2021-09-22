//
//  MTBottomPanelViewPresenter.h
//  BottomPanelView
//
//  Created by Tom.Liu on 22/09/21.
//
//

#import <Foundation/Foundation.h>

#import "MTBottomPanelViewModuleInterface.h"

#import "MTBottomPanelViewInteractor.h"
#import "MTBottomPanelViewWireframe.h"
#import "MTBottomPanelViewViewInterface.h"

@class MTBottomPanelViewWireframe;
@class MTBottomPanelViewInteractor;

/**
 Display logic for the BottomPanelView module.
 */
@interface MTBottomPanelViewPresenter : NSObject <MTBottomPanelViewModuleInterface>

@property (nonatomic, strong) MTBottomPanelViewInteractor *interactor;
@property (nonatomic, weak) MTBottomPanelViewWireframe *wireframe;

//@property (nonatomic, weak) UIViewController<MTBottomPanelViewViewInterface> *userInterface;
@property (nonatomic, weak) UIView<MTBottomPanelViewViewInterface> *userInterface;

@end
