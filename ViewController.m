//
//  ViewController.m
//  ASimpleCATransition
//
//  Created by Fancy on 16/2/16.
//  Copyright © 2016年 Fancy. All rights reserved.
//

#import "ViewController.h"

#define DURATION 0.7f
#define IMAGE1 @"1.jpg"
#define IMAGE2 @"2.jpg"
#define IMAGE3 @"3.jpg"
#define IMAGE4 @"4.jpg"

@interface ViewController ()


@property (nonatomic, assign) int subtype;


@end


typedef enum : NSUInteger{
    
    Fade = 1,                               //淡入淡出
    Push,                                   //推挤
    Reveal,                                 //揭开
    MoveIn,                                 //覆盖
    Cube,                                   //立方体
    SuckEffect,                             //吮吸
    OglFlip,                                //翻转
    RippleEffect,                           //波纹
    PageCurl,                               //翻页
    PageUnCurl,                             //反翻页
    CameraIrisHollowOpen,                   //开镜头
    CameraIrisHollowClose,                  //关镜头
    CurlDown,                               //下翻页
    CurlUp,                                 //上翻页
    FlipFromLeft,                           //左翻转
    FlipFromRight,                          //右翻转




} AnimationType;



@implementation ViewController
- (IBAction)TapButton:(id)sender {
    NSString *subTypeString;
    UIButton *bt = sender;
    AnimationType animationType=bt.tag;
    switch (_subtype) {
        case 0:
            subTypeString = kCATransitionFromLeft;
            break;
        case 1:
            subTypeString = kCATransitionFromBottom;
            break;
        case 2:
            subTypeString = kCATransitionFromRight;
            break;
        case 3:
            subTypeString = kCATransitionFromTop;
            break;
        case 4:
            subTypeString = kCATransitionFade;
            break;
        case 5:
            subTypeString = kCATransitionPush;
            break;
        case 6:
            subTypeString = kCATransitionReveal;
            break;
            
        default:
            break;
    }
    _subtype +=1;
    if (_subtype > 6) {
        _subtype = 0;
    }
    
    switch (animationType) {
            case Fade:
            [self transitionWithType:kCATransitionFade WithSubtype:subTypeString ForView:self.view];
            break;
            
        case Push:
            [self transitionWithType:kCATransitionPush WithSubtype:subTypeString ForView:self.view];
            break;
            
        case Reveal:
            [self transitionWithType:kCATransitionReveal WithSubtype:subTypeString ForView:self.view];
            break;
            
        case MoveIn:
            [self transitionWithType:kCATransitionMoveIn WithSubtype:subTypeString ForView:self.view];
            break;
            
        case Cube:
            [self transitionWithType:@"cube" WithSubtype:subTypeString ForView:self.view];
            break;
            
        case SuckEffect:
            [self transitionWithType:@"suckEffect" WithSubtype:subTypeString ForView:self.view];
            break;
            
        case OglFlip:
            [self transitionWithType:@"oglFlip" WithSubtype:subTypeString ForView:self.view];
            break;
            
        case RippleEffect:
            [self transitionWithType:@"rippleEffect" WithSubtype:subTypeString ForView:self.view];
            break;
            
        case PageCurl:
            [self transitionWithType:@"pageCurl" WithSubtype:subTypeString ForView:self.view];
            break;
            
        case PageUnCurl:
            [self transitionWithType:@"pageUnCurl" WithSubtype:subTypeString ForView:self.view];
            break;
            
        case CameraIrisHollowOpen:
            [self transitionWithType:@"cameraIrisHollowOpen" WithSubtype:subTypeString ForView:self.view];
            break;
            
        case CameraIrisHollowClose:
            [self transitionWithType:@"cameraIrisHollowClose" WithSubtype:subTypeString ForView:self.view];
            break;
            
        case CurlDown:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlDown];
            break;
            
        case CurlUp:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlUp];
            break;
            
        case FlipFromLeft:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
            break;
            
        case FlipFromRight:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromRight];
            break;

            
        default:
            break;
    }
    static int i=0;
    if (i == 0) {
        [self addBackgroundImagedWithImageName:IMAGE1];
        i = 1;
    }
    else if(i ==1)
    {
    
        [self addBackgroundImagedWithImageName:IMAGE2];
        i = 2;
    
    }
    else if (i ==2)
    {  [self addBackgroundImagedWithImageName:IMAGE3];
    i = 3;
    
    
    }
    else
    {
    
        [self addBackgroundImagedWithImageName: IMAGE4];
        i=0;
        
    }
    
    
        
    
    
}

#pragma CATransition动画实现
- (void)transitionWithType:(NSString *)type WithSubtype:(NSString *)subtype ForView : (UIView *) view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    //设置运动时间
    animation.duration = DURATION;
    //设置运动类型
    animation.type = type;
    if (subtype != nil) {
    
        //设置子类
        animation.subtype = subtype;
        
    }
// 设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [view.layer addAnimation:animation forKey:@"animation"];




}


#pragma UIView实现动画

- (void)animationWithView : (UIView *) view WithAnimationTransition : (UIViewAnimationTransition) transition
{
    [UIView animateWithDuration:DURATION animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    
    }];

}



#pragma  给view添加背景图片


- (void)addBackgroundImagedWithImageName:(NSString *) imageName
{

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    _subtype=0;
    [self addBackgroundImagedWithImageName:IMAGE1];
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)changeView
{
    CATransition *t=[CATransition animation];
    t.duration=0.8f;
    t.type=kCATransitionFromLeft;
    
    



}

@end
