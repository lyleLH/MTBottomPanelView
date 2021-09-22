//
//  MTBottomPanelViewModule.h
//  MTBottomPanelView
//
//  Created by 刘浩 on 9/22/21.
//

#import <Foundation/Foundation.h>
#import "MTBottomPanelViewModuleInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface MTBottomPanelViewModule : NSObject

@property (nonatomic, strong) id<MTBottomPanelViewModuleDelegate> delegate;
 
@property (nonatomic, strong) id<MTBottomPanelViewModuleDatasource> datasource;

- (void)showPannelInVc:(UIViewController *)vc ;
- (void)updateStatusinIndex:(NSInteger)index ;


@end

NS_ASSUME_NONNULL_END
