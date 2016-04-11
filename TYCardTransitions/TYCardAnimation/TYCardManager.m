//
//  TYCardManager.m
//  TYCardTransitions
//
//  Created by Yeekyo on 16/4/11.
//  Copyright © 2016年 Yeekyo. All rights reserved.
//

#import "TYCardManager.h"
#import "ModelViewController.h"
#import "ViewController.h"
#import "TYCardTransition.h"
#import "TYCardReverseTransition.h"

@implementation TYCardManager

- (void)setMainController:(ViewController *)mainController{
    
    self.cardAnimation = [[TYCardTransition alloc]init];
    self.reverseAnimation = [[TYCardReverseTransition alloc]init];
    
    _mainController = mainController;
    UIScreenEdgePanGestureRecognizer *panGesture = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(gestureHandler:)];
    panGesture.edges = UIRectEdgeLeft;
    
    [self.mainController.view.superview addGestureRecognizer:panGesture];
}




#pragma mark - UIViewControllerAnimatedTransitioning

- (void)gestureHandler:(UIScreenEdgePanGestureRecognizer*)recognizer{
    
    CGPoint location = [recognizer locationInView:self.mainController.view.superview];
    CGPoint velocity = [recognizer velocityInView:self.mainController.view.superview];
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        if (location.x < CGRectGetMidX(recognizer.view.bounds)) {
            if(!self.modalController){
                self.interactionController = [[UIPercentDrivenInteractiveTransition alloc]init];
                self.modalController = [[ModelViewController alloc]init];
                self.modalController.transitioningDelegate = self;
                [self.mainController presentViewController:self.modalController animated:YES completion:nil];
            }
        }
    }
    
    else if (recognizer.state == UIGestureRecognizerStateChanged) {
        
        CGFloat animationRatio = location.x / CGRectGetWidth(self.mainController.view.superview.bounds);
        [self.interactionController updateInteractiveTransition:animationRatio];
    }
    
    else if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        if (velocity.x > 0) {
            [self.interactionController finishInteractiveTransition];
        }
        else {
            [self.interactionController cancelInteractiveTransition];
        }
        self.interactionController = nil;
    }
}


#pragma mark - UIVieControllerTransitioningDelegate -

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting
                                                                       sourceController:(UIViewController *)source{
    return self.cardAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.reverseAnimation;
}


- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator{
    return self.interactionController;
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    return nil;
}


@end
