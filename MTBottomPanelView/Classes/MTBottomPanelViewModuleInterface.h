//
//  MTBottomPanelViewModuleInterface.h
//  BottomPanelView
//
//  Created by Tom.Liu on 22/09/21.
//
//

#import <Foundation/Foundation.h>

/**
 Module interface for the BottomPanelView module.
 */
@protocol MTBottomPanelViewModuleInterface <NSObject>

- (void)updatePannelStatus:(id)status;

- (void)updatePannelData:(id)data;

@end

/**
 Module delegate for the BottomPanelView module.
 */
@protocol MTBottomPanelViewModuleDelegate <NSObject>
- (BOOL)showWithTabbar;
- (UIView *)contentViewForPanelViewWithIndexPath:(NSIndexPath *)indexPath ;

- (CGFloat) heightForPanelViewWithIndexPath:(NSIndexPath *)indexPath ;

@end


@protocol MTBottomPanelViewModuleDatasource <NSObject>

- (NSInteger)numberOfContentViewsInPanel:(UIView *)panelView ;

@end
