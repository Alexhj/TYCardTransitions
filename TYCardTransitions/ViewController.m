//
//  ViewController.m
//  TYCardTransitions
//
//  Created by Yeekyo on 16/4/11.
//  Copyright © 2016年 Yeekyo. All rights reserved.
//

#import "ViewController.h"
#import "TYCardManager.h"

@interface ViewController ()

@property (nonatomic, strong) TYCardManager *transitionManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"main"];
    [self.view addSubview:imageView];
}

- (void)viewDidAppear:(BOOL)animated {
    self.transitionManager = [[TYCardManager alloc]init];
    self.transitionManager.mainController = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
