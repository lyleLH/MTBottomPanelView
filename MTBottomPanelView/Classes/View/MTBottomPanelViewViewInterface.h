//
//  MTBottomPanelViewView.h
//  BottomPanelView
//
//  Created by Tom.Liu on 22/09/21.
//
//

#import <Foundation/Foundation.h>

/**
 View interface for the BottomPanelView module.
 */
@protocol MTBottomPanelViewViewInterface <NSObject>

- (void)updatePanelViewInIndexPath:(NSIndexPath *)indexPath data:(id)data;

@end
