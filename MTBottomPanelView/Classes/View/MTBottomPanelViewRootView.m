//
//  MTBottomPanelViewRootView.m
//  MTBottomPanelView
//
//  Created by 刘浩 on 9/22/21.
//

#import "MTBottomPanelViewRootView.h"
#import "MTBottomPanelViewChildView.h"
#import <MTCategoryComponent/MTCategoryComponentHeader.h>
#import <pop/POP.h>

@interface MTBottomPanelViewRootView ()

@property (nonatomic,strong)MTBottomPanelViewChildView * currentStatusView;
@property (nonatomic,strong)id currentStatus;
@end


@implementation MTBottomPanelViewRootView

- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = [UIColor whiteColor];
 
}

- (void)showAnimationWithStatus:(NSNumber *)status {
    [self mt_setTopCornerWithRadius:15 bgColor:[UIColor whiteColor]];
    self.layer.shadowColor = [UIColor mt_colorWithHex:0xD5E0F3].CGColor;
    self.layer.shadowOffset = CGSizeMake(0,5);
    self.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 10;
    self.layer.cornerRadius = 10;
    
    NSNumber * currentHeight = @[@160,@240,@300,@240,@180,@260][[status intValue]-1];
    [self setFrame:CGRectMake(5, [UIScreen mainScreen].bounds.size.height , [UIScreen mainScreen].bounds.size.width-10, currentHeight.intValue)];
    POPSpringAnimation *positionY = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    positionY.toValue             =  @(self.frame.origin.y - self.frame.size.height*0.5);
    positionY.dynamicsTension     = 1000;
    positionY.dynamicsMass        = 1.3;
    positionY.dynamicsFriction    = 10.3;
    positionY.springSpeed         = 100;
    positionY.springBounciness    = 5;
    [self.layer pop_addAnimation:positionY forKey:nil];
    
}



- (void)updatePanelViewStatus:(id)status data:(id)data {
    if(!(_currentStatus == status)) {
        _currentStatus = status;
        [self showAnimationWithStatus:status];
    }
    [self.currentStatusView removeFromSuperview];
    self.currentStatusView = [MTBottomPanelViewChildView createPanelContenViewWithStatus:status];
    [self addSubview:self.currentStatusView];
}
 
@end
