//
//  MTBottomPanelViewChildView.m
//  MTBottomPanelView
//
//  Created by 刘浩 on 9/22/21.
//

#import "MTBottomPanelViewChildView.h"
#import <MTCategoryComponent/MTCategoryComponentHeader.h>
#import "UIImage+MTBottomPanelViewBundleImage.h"
@interface MTBottomPanelViewChildView ()

@end


@implementation MTBottomPanelViewChildView


+ (MTBottomPanelViewChildView *)createPanelContenViewWithStatus:(id)status  {
    NSNumber * statuNum = (NSNumber*)status;
    MTBottomPanelViewChildView * childView = [[MTBottomPanelViewChildView alloc] init];
    UIImage * image = [UIImage mt_imageWithName:@"icon_current_location" inBundle:@"MTBottomPanelView"];
    UIImageView * imageView =  [[UIImageView alloc] initWithImage:image];
    [childView addSubview:imageView];
    switch (statuNum.intValue) {
        case 1:
        {
            
        }
            break;
            
        default:
            break;
    }
    return  childView;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = [UIColor mt_randomColor];
   
}




@end
