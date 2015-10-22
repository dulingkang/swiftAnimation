//
//  FirstViewController.swift
//  LaunchAnimation
//
//  Created by ShawnDu on 15/10/13.
//  Copyright © 2015年 Beijing Smarter Eye Technology Co., Ltd. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blueColor()
        let iconSmallImage = UIImage(named: "iconLabel")
        let imageView = UIImageView.init(frame: CGRectMake((Constant.screenWidth - iconSmallImage!.size.width)/2, (Constant.screenHeight - iconSmallImage!.size.height)/2, iconSmallImage!.size.width, iconSmallImage!.size.height))
        imageView.image = iconSmallImage
        self.view.addSubview(imageView)
    }
    
    @IBAction func rightButtonPressed(sender: UIButton) {
        let secondVC = SecondViewController.init()
        self.navigationController!.pushViewController(secondVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

