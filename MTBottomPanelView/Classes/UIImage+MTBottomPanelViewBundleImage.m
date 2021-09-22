//
//  UIImage+BundleImage.m
//  AFNetworking
//
//  Created by Tom on 2021/9/12.
//

#import "UIImage+MTBottomPanelViewBundleImage.h"

@implementation UIImage (MTBottomPanelViewBundleImage)

+ (UIImage *)mt_imageWithName:(NSString*)name inBundle:(NSString*)bundleName {
    static NSBundle * bundle = nil;
    if(!bundle){
        NSString * path =    [[NSBundle bundleForClass:NSClassFromString(@"MTBottomPanelView")] pathForResource:bundleName ofType:@"bundle"];
        bundle = [NSBundle bundleWithPath:path];
    }
    if(!bundle){
        NSLog(@"[- - >] 找不到正确的bundle %@ ",bundleName);
    }
    return [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
}
@end
