//
//  ViewController.m
//  父子控制器test
//
//  Created by apple on 16/8/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "NewsViewController.h"
#import "HotlineViewController.h"
#import "SocietyViewController.h"



#define ScreenW  [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *tabBar;
@property (weak, nonatomic) IBOutlet UIView *ContentView;

@end

@implementation ViewController
- (IBAction)btnClick:(UIButton *)sender {
    //移走前面的那一个,然后再添加上去
    
    for (UIView *view in self.ContentView.subviews) {
        [view removeFromSuperview];
    }

    
    //根据参数拿到子控制器
    UIViewController *vc = self.childViewControllers[sender.tag];
    vc.view.backgroundColor = sender.backgroundColor;
    vc.view.frame = self.ContentView.bounds;
    
    [self.ContentView addSubview:vc.view];
   

}
//关键的步骤在于如何得到对应的数组

- (void)viewDidLoad {
    [super viewDidLoad];
 
    //1.设置所有的子控制器
    [self setupAllSubVCS];
    
    //2.设置子控制器对应的按钮内容
    //思路:一个子控制器对应一个按钮,但是这个怎么对应呢?
    //关键:tabBar的子控件按钮对应控制器的子控制器
    //先遍历按钮
    
    int i = 0;
    for (UIButton *btn in self.tabBar.subviews) {
        //拿到每一个子控制器
        UIViewController *vc = self.childViewControllers[i];
        i++;
        
        [btn setTitle:vc.title forState:UIControlStateNormal];
    }
    
    
    /**
     *  github的测试操作
     *
     *  @return 没有返回值
     */


}
//添加所有的控制器
-(void)setupAllSubVCS {
    NewsViewController *newsVc = [[NewsViewController alloc]init];
    newsVc.title = @"新闻";
    [self addChildViewController:newsVc];
    HotlineViewController *hotlineVc = [[HotlineViewController alloc]init];
    hotlineVc.title = @"热点";
    [self addChildViewController:hotlineVc];
    
    SocietyViewController *SocietyVc = [[SocietyViewController alloc]init];
    SocietyVc.title = @"社会";
    [self addChildViewController:SocietyVc];

    
}

@end
