//
//  LoginViewController.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

/**
 用户账号
 */
@property (nonatomic, strong) UITextField *accountTextField;

/**
 账户密码
 */
@property (nonatomic, strong) UITextField *passwordTextField;

/**
 已有账号直接登录登录
 */
@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColorFromRGB(0x070200)];
    [self.navigationController setNavigationBarHidden:YES];
    // 界面布局
    [self configLoingVC];
}

#pragma mark - 界面布局
- (void)configLoingVC {
    // 用户账号
    _accountTextField = [UITextField textFieldWithTextAlignment:(NSTextAlignmentLeft) withTextColor:UIColorFromRGB(0xFFFFFF) withFont:SystemFont(15)];
    _accountTextField.placeholder = @"账 户";
    [_accountTextField setValue:UIColorFromRGB(0xFFFFFF) forKeyPath:@"_placeholderLabel.textColor"];
    [_accountTextField setValue:SystemFont(16) forKeyPath:@"_placeholderLabel.font"];
    _accountTextField.tintColor = UIColorFromRGB(0xFFFFFF);
    _accountTextField.delegate = self;
    [self.view addSubview:_accountTextField];
    
    // 账户密码
    _passwordTextField = [UITextField textFieldWithTextAlignment:(NSTextAlignmentLeft) withTextColor:UIColorFromRGB(0xFFFFFF) withFont:SystemFont(15)];
    _passwordTextField.placeholder = @"密 码";
    [_passwordTextField setValue:UIColorFromRGB(0xFFFFFF) forKeyPath:@"_placeholderLabel.textColor"];
    [_passwordTextField setValue:SystemFont(16) forKeyPath:@"_placeholderLabel.font"];
    _passwordTextField.tintColor = UIColorFromRGB(0xFFFFFF);
    _passwordTextField.delegate  = self;
    _passwordTextField.returnKeyType = UIReturnKeyJoin;
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.delegate = self;
    [self.view addSubview:_passwordTextField];
    
    
    // 登录
    _loginBtn = [UIButton buttonWithString:@"登 录" withBackgroundImage:nil withBackgroundColor:nil  withTextAlignment:(NSTextAlignmentCenter) withTextColor:UIColorFromRGB(0xFFFFFF) withFont:SystemFont(16)];
    _loginBtn.layer.borderColor = UIColorFromRGB(0xFFFFFF).CGColor;
    _loginBtn.layer.borderWidth = viewWidth(2);
    _loginBtn.layer.cornerRadius = viewWidth(5);
    [_loginBtn addTarget:self action:@selector(userLoginAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview: _loginBtn];
    
    // 分割线
    UIView *oneLineView = [UIView lineViewWithColor:UIColorFromRGB(0xFFFFFF)];
    [self.view addSubview:oneLineView];
    
    UIView *towLineView = [UIView lineViewWithColor:UIColorFromRGB(0xFFFFFF)];
    [self.view addSubview:towLineView];
    
    // 排版
    __weak typeof(self) weakself = self;
    [_accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakself.view.mas_top).offset(viewHeight(120));
        make.left.equalTo(weakself.view.mas_left).offset(viewWidth(58));
        make.right.equalTo(weakself.view.mas_right).offset(-viewWidth(58));
        make.height.equalTo(@(viewHeight(55)));
        
    }];
    
    [oneLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakself.accountTextField.mas_bottom).offset(viewHeight(15));
        make.left.equalTo(weakself.view.mas_left).offset(viewWidth(58));
        make.right.equalTo(weakself.view.mas_right).offset(-viewWidth(58));
        make.height.equalTo(@(viewHeight(2)));
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(oneLineView.mas_bottom).offset(viewHeight(20));
        make.left.equalTo(weakself.view.mas_left).offset(viewWidth(58));
        make.right.equalTo(weakself.view.mas_right).offset(-viewWidth(58));
        make.height.equalTo(@(viewHeight(55)));
    }];
    
    [towLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakself.passwordTextField.mas_bottom).offset(viewHeight(15));
        make.left.equalTo(weakself.view.mas_left).offset(viewWidth(58));
        make.right.equalTo(weakself.view.mas_right).offset(-viewWidth(58));
        make.height.equalTo(@(viewHeight(2)));
    }];
    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(towLineView.mas_bottom).offset(viewHeight(150));
        make.left.equalTo(weakself.view.mas_left).offset(viewWidth(58));
        make.right.equalTo(weakself.view.mas_right).offset(-viewWidth(58));
        make.height.equalTo(@(viewHeight(50)));
        
    }];
}

#pragma mark - UITextFieldDelegate (代理事件)
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.passwordTextField) {
        
        // 用户登录
        [self userLoginAction];
    }
    [textField resignFirstResponder];
    return NO ;
}

#pragma mark - Action(事件)
#pragma mark 用户登录
- (void)userLoginAction {
    __weak typeof(self) weakself = self;
    [HJMBProgressHUD showLoadingWithBlackColorIndeterminateInView:self.view isResponse:NO];
    [[UserManager defaultManager] logInUserWithLogin:self.accountTextField.text password:self.passwordTextField.text  success:^(BOOL isSuccess, NSString *message) {
        [HJMBProgressHUD hideWithView:weakself.view];
        if (isSuccess) {
            [[ViewController defaultRootViewController] transitionMainViewController];
            
        }else {
            [HJMBProgressHUD showLoadingTipsInView:AppMainWindow title:message detail:@"" withIsAutoHide:YES];
        }
    } failure:^(NSString *errorMessage) {
        [HJMBProgressHUD showLoadingTipsInView:weakself.view title:errorMessage detail:@"" withIsAutoHide:YES];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
