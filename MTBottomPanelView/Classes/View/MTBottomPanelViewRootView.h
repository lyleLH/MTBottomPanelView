//
//  MTBottomPanelViewRootView.h
//  MTBottomPanelView
//
//  Created by 刘浩 on 9/22/21.
//

#import <UIKit/UIKit.h>
#import "MTBottomPanelViewModuleInterface.h"
#import "MTBottomPanelViewViewInterface.h"



NS_ASSUME_NONNULL_BEGIN

@interface MTBottomPanelViewRootView : UIView
<MTBottomPanelViewViewInterface>

@property (nonatomic, strong) id<MTBottomPanelViewModuleInterface> eventHandler;

@property (nonatomic, strong) id<MTBottomPanelViewModuleDelegate> delegate;
 
@property (nonatomic, strong) id<MTBottomPanelViewModuleDatasource> datasource;

@end

NS_ASSUME_NONNULL_END
