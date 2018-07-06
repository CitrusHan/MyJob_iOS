//
//  ViewController.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"
#import "ToolboxViewController.h"
#import "UserViewController.h"
#import "LoginViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIViewController *activeViewController;
@property (nonatomic, strong, readwrite) UIViewController *nextViewController;
@property (nonatomic, strong) UITabBarController *tabBarController;
/**
 首页
 */
@property (nonatomic, strong) UINavigationController *homeNC;
/**
 工具箱
 */
@property (nonatomic, strong) UINavigationController *toolboxNC;
/**
 我的
 */
@property (nonatomic, strong) UINavigationController *userNC;

@end

@implementation ViewController

/**
 单例
 */
static ViewController *default_viewController = nil;
+ (ViewController*)defaultRootViewController {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (default_viewController == nil) {
            default_viewController = [ViewController new];
        }
        
    });
    return default_viewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    if (![UserManager defaultManager].activeUser ) {
//        // 用户未登录
//        [self transitionDisplayViewController];
//    }else {
//        // 用户登录
//        [self transitionMainViewController];
//    }
    
    [self transitionMainViewController];
}

/**
 退出登录
 */
- (void)transitionLogoutViewController {
    [[UserManager defaultManager] logOutActiveUser];
    [self transitionDisplayViewController];
}

/**
 未登录登录
 */
- (void)transitionDisplayViewController {
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    UINavigationController *loginNVC = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [self transitionToViewController:loginNVC animated:YES withCompletion:NULL];
    
}

/**
 登录
 */
- (void)transitionMainViewController {
#pragma mark 嵌套方式：tabBar嵌套navigation（灵活，一般作为选择对象）
    // 首页
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *homeNC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNC.tabBarItem = [[UITabBarItem alloc] init];
    homeNC.tabBarItem.title = @"首页";
    [homeNC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xb2b2b2)} forState:(UIControlStateNormal)];
    [homeNC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x058cc6)} forState:(UIControlStateSelected)];
    homeNC.tabBarItem.image = [[UIImage imageNamed:@"icon_tabBar_home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNC.tabBarItem.selectedImage = [[[UIImage imageNamed:@"icon_tabBar_home"]  tintImageWithColor:UIColorFromRGB(0x058cc6)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _homeNC = homeNC;
    // 工具箱
    ToolboxViewController *toolboxVC = [[ToolboxViewController alloc] init];
    UINavigationController *toolboxNC = [[UINavigationController alloc] initWithRootViewController:toolboxVC];
    toolboxNC.tabBarItem = [[UITabBarItem alloc] init];
    toolboxNC.tabBarItem.title = @"工具箱";
    [toolboxNC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xb2b2b2)} forState:(UIControlStateNormal)];
    [toolboxNC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x058cc6)} forState:(UIControlStateSelected)];
    toolboxNC.tabBarItem.image = [[UIImage imageNamed:@"icon_tabBar_toolbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    toolboxNC.tabBarItem.selectedImage = [[[UIImage imageNamed:@"icon_tabBar_toolbox"] tintImageWithColor:UIColorFromRGB(0x058cc6)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _toolboxNC = toolboxNC;
    // 我的
    UserViewController *userVC = [[UserViewController alloc] init];
    UINavigationController *userNC = [[UINavigationController alloc] initWithRootViewController:userVC];
    userNC.tabBarItem = [[UITabBarItem alloc] init];
    userNC.tabBarItem.title = @"我的";
    [userNC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xb2b2b2)} forState:(UIControlStateNormal)];
    [userNC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x058cc6)} forState:(UIControlStateSelected)];
    userNC.tabBarItem.image = [[UIImage imageNamed:@"icon_tabBar_user"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    userNC.tabBarItem.selectedImage = [[[UIImage imageNamed:@"icon_tabBar_user"] tintImageWithColor:UIColorFromRGB(0x058cc6)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _userNC = userNC;
    
    // 设置底部功能栏
    self.tabBarController = [[UITabBarController alloc] init];
    // 把NC嵌套到tabBar中
    self.tabBarController.viewControllers = @[_homeNC,_toolboxNC,_userNC];
#pragma mark - TabBar设置
    // 设置默认选中标签
    self.tabBarController.selectedIndex = 0;
    // 设置tabBar颜色
    self.tabBarController.tabBar.tintColor = [UIColor whiteColor];
    [self transitionToViewController:self.tabBarController animated:NO withCompletion:NULL];
}

- (void)transitionToViewController:(UIViewController *)viewController
                          animated:(BOOL)animated
                    withCompletion:( void (^)(void) )completion {
    if (self.nextViewController == nil) {
        // This is the first request to transition to view controller.
        [self.activeViewController willMoveToParentViewController:nil];
    } else {
        // During an animation it's possible that multiple calls to this method are made. Make sure to remove previously added view controller from parent.
        [self.nextViewController removeFromParentViewController];
        [self.nextViewController.view removeFromSuperview];
    }
    
    self.nextViewController = viewController;
    [self addChildViewController:viewController];
    viewController.view.alpha = 0.0;
    viewController.view.frame = self.view.bounds;
    viewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:viewController.view];
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:animated ? 0.25 : 0 animations:^{
        viewController.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        [weakSelf.view bringSubviewToFront:viewController.view];
        [weakSelf.activeViewController.view removeFromSuperview];
        // Only complete the transition if the current viewController is the laFavorPets one.
        if (weakSelf.nextViewController == viewController) {
            
            [weakSelf.activeViewController dismissViewControllerAnimated:animated completion:nil];
            [weakSelf.activeViewController removeFromParentViewController];
            weakSelf.activeViewController = weakSelf.nextViewController;
            [weakSelf.nextViewController didMoveToParentViewController:weakSelf];
            
            weakSelf.nextViewController = nil;
            
            [weakSelf setNeedsStatusBarAppearanceUpdate];
            
            if (completion != NULL) {
                completion();
            }
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
