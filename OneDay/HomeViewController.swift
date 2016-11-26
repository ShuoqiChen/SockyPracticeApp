//
//  HomeViewController.swift
//  OneDay
//
//  Created by Shuoqi Chen on 11/23/16.
//  Copyright © 2016 Shuoqi Chen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var titleOfOtherPages = ""

    @IBOutlet var panGesture: UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

                // 设置中间 segmentView 视图
                let segmentView = UISegmentedControl(items: ["Message", "Cell"])
                segmentView.selectedSegmentIndex = 0
                segmentView.setWidth(60, forSegmentAt: 0)
                segmentView.setWidth(60, forSegmentAt: 1)
                self.navigationItem.titleView = segmentView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMenuPages" {
            if let a = segue.destination as? MenuPagesViewController {
                a.PageTitle = titleOfOtherPages
            }
        }
    }

    

}
