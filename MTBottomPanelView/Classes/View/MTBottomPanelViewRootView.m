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

#import <MTLayoutUtilityComponent/MTLayoutUtilityComponentHeader.h>


@interface MTBottomPanelViewRootView ()
@property (nonatomic,strong)UIView * contentView;
@property (nonatomic,strong)UIView * currentStatusView;
@property (nonatomic,strong)id currentStatus;
@property (nonatomic,strong)NSNumber * totalNumberOfPanel;
@end


@implementation MTBottomPanelViewRootView

- (NSNumber *)totalNumberOfPanel {
    if([self.datasource respondsToSelector:@selector(numberOfContentViewsInPanel:)]){
        _totalNumberOfPanel = [NSNumber numberWithInteger:[self.datasource numberOfContentViewsInPanel:self]];
    }
    return _totalNumberOfPanel;
}

- (UIView *)contentView {
    if(!_contentView){
        _contentView = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:_contentView];
        [_contentView mt_addRounderCornerWithRadius:15 size:self.bounds.size];
        _contentView.layer.masksToBounds = YES;
        _contentView.clipsToBounds = YES;
    }
    return _contentView;
}

- (instancetype)init {
    if(self ==[super init]){
        self.backgroundColor = [UIColor clearColor];
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0,5);
        self.layer.shadowOpacity = 1;
        self.layer.shadowRadius = 10;
 
        self.layer.masksToBounds = NO;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

 
}

- (void)showAnimationWithViewHeight:(CGFloat)height {
    CGFloat horizonalMargin = 0.0;
    BOOL isFromTabbar = NO;
    if([self.delegate respondsToSelector:@selector(showWithTabbar)]){
        isFromTabbar =  [self.delegate showWithTabbar];
    }
    
    [self setFrame:CGRectMake(horizonalMargin,
                              [UIScreen mainScreen].bounds.size.height - (isFromTabbar?([self isIPhoneNotchScreen]?83:49):0),
                              [UIScreen mainScreen].bounds.size.width - 2* horizonalMargin,
                              height)];
    
    POPSpringAnimation *positionY = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    positionY.toValue             =  @(self.frame.origin.y - self.frame.size.height*0.5);
    positionY.dynamicsTension     = 1000;
    positionY.dynamicsMass        = 1.3;
    positionY.dynamicsFriction    = 10.3;
    positionY.springSpeed         = 100;
    positionY.springBounciness    = 5;
    [self.layer pop_addAnimation:positionY forKey:nil];
    
}




- (void)updatePanelViewInIndexPath:(id)status data:(id)data {
    
    if(!(_currentStatus == status)) {
        _currentStatus = status;
        CGFloat height;
        if([self.delegate respondsToSelector:@selector(heightForPanelViewWithIndexPath:)]){
            height =  [self.delegate heightForPanelViewWithIndexPath:status];
            [self showAnimationWithViewHeight:height];
        }
    }
    [self.currentStatusView removeFromSuperview];
    
    if([self.delegate respondsToSelector:@selector(contentViewForPanelViewWithIndexPath:)]){
      self.currentStatusView  =  [self.delegate contentViewForPanelViewWithIndexPath:status];
    }
    [self.contentView setFrame:self.bounds];
    [self.contentView addSubview:self.currentStatusView];
    [self.currentStatusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.to(self.contentView).left(0).right(0).top(0).bottom(0);
    }];
}


- (BOOL)isIPhoneNotchScreen{
    BOOL result = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return result;
    }
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            result = YES;
        }
    }
    return result;
}

@end
