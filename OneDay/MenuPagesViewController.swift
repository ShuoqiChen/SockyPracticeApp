//
//  MenuPagesViewController.swift
//  OneDay
//
//  Created by Shuoqi Chen on 11/24/16.
//  Copyright © 2016 Shuoqi Chen. All rights reserved.
//

import UIKit

class MenuPagesViewController: UIViewController {

        var PageTitle: String! // 从 HomeViewController 传递过来的值
    
    @IBOutlet weak var mainLabel: UILabel!
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
    
            self.title = PageTitle
            mainLabel.text = PageTitle
    
            // 自定义返回按钮
            let backButton = UIBarButtonItem(title: "くBack", style: UIBarButtonItemStyle.plain, target: self, action: #selector(MenuPagesViewController.goBack))
            self.navigationItem.leftBarButtonItem = backButton
    
            // 弥补因为返回按钮被替换导致的边缘滑入手势失效的问题
            let gesture = UIPanGestureRecognizer(target: self, action: #selector(MenuPagesViewController.goBack))
            self.view.addGestureRecognizer(gesture)
        }
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
        func goBack() {
            _ = self.navigationController?.popViewController(animated: true)
//            Common.rootViewController.mainTabBarController.tabBar.isHidden = false
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

