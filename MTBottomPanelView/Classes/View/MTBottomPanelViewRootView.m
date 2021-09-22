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

- (instancetype)init {
    if(self ==[super init]){
        self.backgroundColor = [UIColor whiteColor];
       
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0,5);
        self.layer.shadowOpacity = 1;
        self.layer.shadowRadius = 10;
//        self.layer.cornerRadius = 1.0;
        
  
        [self mt_addRounderCornerWithRadius:15 size:self.bounds.size];
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
    [self addSubview:self.currentStatusView];
}



@end
