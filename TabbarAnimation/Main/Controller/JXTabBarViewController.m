//
//  JXTabBarViewController.m
//  TabbarAnimation
//
//  Created by mac on 2016/11/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "JXTabBarViewController.h"
#import "JXViewController.h"
#import "JXTabBar.h"

@interface JXTabBarViewController ()

/** tabbar中的所有itemButton组成的数组 */
@property (nonatomic, strong) NSMutableArray *itemButtons;

@end

@implementation JXTabBarViewController
#pragma makr - lazy
- (NSMutableArray *)itemButtons {
    if (_itemButtons == nil) {
        _itemButtons = [NSMutableArray array];
    }
    return _itemButtons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 更换tabbar
    [self setValue:[[JXTabBar alloc] init] forKeyPath:@"tabBar"];
    
    JXViewController *vc1 = [[JXViewController alloc] init];
    [self setupChildViewController:vc1 title:@"主页" image:@"BarItemNormal1" selectImage:@"BarItemSelected1"];
    
    JXViewController *vc2 = [[JXViewController alloc] init];
    [self setupChildViewController:vc2 title:@"查询" image:@"BarItemNormal2" selectImage:@"BarItemSelected2"];
    
    JXViewController *vc3 = [[JXViewController alloc] init];
    [self setupChildViewController:vc3 title:@"旅行" image:@"BarItemNormal3" selectImage:@"BarItemSelected3"];
    
    JXViewController *vc4 = [[JXViewController alloc] init];
    [self setupChildViewController:vc4 title:@"购物" image:@"BarItemNormal4" selectImage:@"BarItemSelected4"];
    
    
}

- (void)setupChildViewController:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage {
    childVC.tabBarItem.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:childVC];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    for (UIView *itemView in self.tabBar.subviews) {
    if ([itemView isKindOfClass:NSClassFromString(@"UITabBarButton")] && [[itemView valueForKeyPath:@"label.text"] isEqualToString:item.title]) {
            UIView *imageView = [itemView valueForKeyPath:@"info"];
            CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
            anim.values = @[@(0), @(M_PI_2), @(M_PI), @(M_PI * 2)];
            anim.duration = 0.5;
            [imageView.layer addAnimation:anim forKey:@"playRotaionAnimation"];
        }
    }

    
}


@end
