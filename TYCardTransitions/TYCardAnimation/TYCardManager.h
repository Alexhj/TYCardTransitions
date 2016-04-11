//
//  TYCardManager.h
//  TYCardTransitions
//
//  Created by Yeekyo on 16/4/11.
//  Copyright © 2016年 Yeekyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TYCardTransition,TYCardReverseTransition,ModelViewController,ViewController;

@interface TYCardManager : NSObject<UIViewControllerTransitioningDelegate>

@property (nonatomic, weak) ViewController *mainController;

@property (nonatomic, strong) ModelViewController *modalController;

@property (nonatomic, strong) TYCardTransition *cardAnimation;

@property (nonatomic, strong) TYCardReverseTransition *reverseAnimation;

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactionController;

@end
