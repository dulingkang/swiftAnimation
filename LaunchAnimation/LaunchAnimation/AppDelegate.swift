//
//  AppDelegate.swift
//  LaunchAnimation
//
//  Created by ShawnDu on 15/10/13.
//  Copyright © 2015年 Beijing Smarter Eye Technology Co., Ltd. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let launchIconWidth: Int = 60
    let minLauchIconWidth: Int = 50
    let maxLauchIconWidth: Int = 2000
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let navigationVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()
        self.window!.makeKeyAndVisible()
        self.window!.backgroundColor = UIColor(red: 0.047, green:0.996,blue:0.447, alpha:1)
        self.window!.rootViewController = navigationVC
        //logo mask
        navigationVC!.view.layer.mask = CALayer()
        navigationVC!.view.layer.mask!.contents = UIImage(named: "logo")!.CGImage
        navigationVC!.view.layer.mask!.position = navigationVC!.view.center
        navigationVC!.view.layer.mask!.bounds = CGRect(x: 0, y: 0, width: launchIconWidth, height: launchIconWidth)
        
        //mask background view
        let maskBackgroundView = UIView.init(frame: navigationVC!.view.bounds)
        maskBackgroundView.backgroundColor = UIColor.whiteColor()
        navigationVC!.view.addSubview(maskBackgroundView)
        navigationVC!.view.bringSubviewToFront(maskBackgroundView)
        
        //mask animation
        let launchIconAnimation = CAKeyframeAnimation(keyPath: "bounds")
        let sourceBounds = NSValue(CGRect: navigationVC!.view.layer.mask!.bounds)
        let middleBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: minLauchIconWidth, height: minLauchIconWidth))
        let lastBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: maxLauchIconWidth, height: maxLauchIconWidth))
        launchIconAnimation.delegate = self
        launchIconAnimation.duration = 1
        launchIconAnimation.beginTime = CACurrentMediaTime() + 1
        
        launchIconAnimation.values = [sourceBounds, middleBounds, lastBounds]
        launchIconAnimation.keyTimes = [0, 0.5, 1]
        launchIconAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        launchIconAnimation.removedOnCompletion = false
        launchIconAnimation.fillMode = kCAFillModeForwards
        navigationVC!.view.layer.mask!.addAnimation(launchIconAnimation, forKey: "launchAnimation")
        
        //maskBackgroundView animation
        UIView.animateWithDuration(0.1, delay: 1.3, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            maskBackgroundView.alpha = 0.0
            }, completion: {
                finished in
                maskBackgroundView.removeFromSuperview()
        })
        
        // animation of navigation Controller
        UIView.animateWithDuration(0.3, delay: 1.3, options: UIViewAnimationOptions.TransitionNone, animations: {
            navigationVC!.view.transform = CGAffineTransformMakeScale(1.05, 1.05)
            },
            completion: { finished in
                UIView.animateWithDuration(0.4, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    navigationVC!.view.transform = CGAffineTransformIdentity
                    }, completion: nil
                )
        })
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

