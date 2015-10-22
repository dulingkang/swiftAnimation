//
//  CustomNavigationVC.swift
//  LaunchAnimation
//
//  Created by ShawnDu on 15/10/17.
//  Copyright © 2015年 Beijing Smarter Eye Technology Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

class CustomNavigationVC: UINavigationController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    var popTransition : UIPercentDrivenInteractiveTransition!
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = self.interactivePopGestureRecognizer
        gesture!.enabled = false
        let gestureView = gesture!.view
        
        let panGesture = UIPanGestureRecognizer.init()
        panGesture.delegate = self
        panGesture.maximumNumberOfTouches = 1
        gestureView!.addGestureRecognizer(panGesture)
        self.delegate = self;
        panGesture.addTarget(self, action: "handleControllerPop:")
    }
    
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count > 1 && !self.valueForKey("_isTransitioning")!.boolValue
    }
    
    func handleControllerPop (recognizer : UIPanGestureRecognizer) {
        let velocity = recognizer.velocityInView(recognizer.view)
        var progress = recognizer.translationInView(recognizer.view).x / Constant.screenWidth
        progress = min(1.0, max(0.0, progress))
        if (recognizer.state == UIGestureRecognizerState.Began) {
            popTransition = UIPercentDrivenInteractiveTransition.init()
            self.popViewControllerAnimated(true)
        } else if (recognizer.state == UIGestureRecognizerState.Changed) {
            popTransition!.updateInteractiveTransition(progress)
        } else if (recognizer.state == UIGestureRecognizerState.Ended || recognizer.state == UIGestureRecognizerState.Cancelled) {
            if (progress > 0.5 || velocity.x > 0) {
                popTransition!.finishInteractiveTransition()
            } else {
                popTransition!.cancelInteractiveTransition()
            }
            popTransition = nil
        }
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if (operation == UINavigationControllerOperation.Pop) {
            let transitionAnimation = TransitionAnimation.init()
            return transitionAnimation
        } else {
            return nil
        }
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if (animationController.isKindOfClass(TransitionAnimation)) {
            return popTransition
        } else {
            return nil
        }
    }
}