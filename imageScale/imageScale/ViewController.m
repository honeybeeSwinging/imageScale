//
//  ViewController.m
//  imageScale
//
//  Created by mc on 2018/1/15.
//  Copyright © 2018年 mc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    imageView.image=[UIImage imageNamed:@"123.jpg"];
    [self.view addSubview:imageView];
    
    
    //缩放
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
    imageView.userInteractionEnabled=YES;
    [imageView addGestureRecognizer:pinchGestureRecognizer];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(requireDoubleGestureRecognizer:)];
    [imageView addGestureRecognizer:tap];
    
    
    
    //
    // Do any additional setup after loading the view, typically from a nib.
}

// 处理缩放手势
- (void) pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer
{
    NSLog(@"pinchView");
    UIView *view = pinchGestureRecognizer.view;
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
        pinchGestureRecognizer.scale = 1;
    }
}

// 谦让双击放大手势
- (void)requireDoubleGestureRecognizer:(UITapGestureRecognizer *)tep{
    tep.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//    [tep requireGestureRecognizerToFail:[[self.view gestureRecognizers] lastObject]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
