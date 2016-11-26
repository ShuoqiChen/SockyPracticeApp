//
//  ProfileViewController.swift
//  OneDay
//
//  Created by Shuoqi Chen on 11/24/16.
//  Copyright © 2016 Shuoqi Chen. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    

    @IBOutlet var panGesture: UIPanGestureRecognizer!
    @IBOutlet weak var titleLabel: UILabel!


    var titleOfOtherPages = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMenuPages" {
            if let a = segue.destination as? MenuPagesViewController {
                a.PageTitle = titleOfOtherPages
            }
        }
    }

//    点击按钮返回主页面
    @IBAction func homeButtonPressed(_ sender: Any) {
//        let homeView = HomeViewController()
//        //从下弹出一个界面作为登陆界面，completion作为闭包，可以写一些弹出loginView时的一些操作
//        self.present(homeView, animated: true, completion: nil)

    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    

    // MARK: - Navigation
    
   
    
}
