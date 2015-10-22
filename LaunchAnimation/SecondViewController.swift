//
//  SecondViewController.swift
//  LaunchAnimation
//
//  Created by ShawnDu on 15/10/16.
//  Copyright © 2015年 Beijing Smarter Eye Technology Co., Ltd. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellowColor()
        let iconSmallImage = UIImage(named: "icon")
        let imageView = UIImageView.init(frame: CGRectMake((Constant.screenWidth - iconSmallImage!.size.width)/2, (Constant.screenHeight - iconSmallImage!.size.height)/2, iconSmallImage!.size.width, iconSmallImage!.size.height))
        imageView.image = iconSmallImage
        self.view.addSubview(imageView)
    }
}

