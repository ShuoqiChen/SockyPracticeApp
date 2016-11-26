//
//  MainTabBarController.swift
//  OneDay
//
//  Created by Shuoqi Chen on 11/24/16.
//  Copyright © 2016 Shuoqi Chen. All rights reserved.
//

import UIKit

// TabBar Controller，主页所有内容的父容器
class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 覆写了 TabBar 的点击效果
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        switch item.tag {
//        case 0:
//            Common.contactsVC.view.removeFromSuperview()
//        case 1:
//            // 这里为了省事采用了简单的 addSubView 方案，真正项目中应该采用 TabBar Controller 自带的 self.viewControllers 方案
////            Common.rootViewController.mainTabBarController.view.addSubview(Common.contactsVC.view)
////            Common.rootViewController.mainTabBarController.view.bringSubview(toFront: Common.rootViewController.mainTabBarController.tabBar)
//        case 2:
//            print("Just like case 1 ↑")
//        default:
//            break
//        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

