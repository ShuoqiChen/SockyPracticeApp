//
//  LeftMenuViewController.swift
//  OneDay
//
//  Created by Shuoqi Chen on 11/24/16.
//  Copyright © 2016 Shuoqi Chen. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let titlesDictionary = ["Home", "Profile", "Mission", "Statistics", "Gear", "Achievement", "Map", "My Story","Settings"]

    
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var heightLayoutConstraintOfMenuTableView: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.tableFooterView = UIView()
        
        
//      control the height of the menu
//        heightLayoutConstraintOfMenuTableView.constant = Common.screenHeight < 500 ? Common.screenHeight * (568 - 221) / 568 : 347
//        self.view.frame = CGRect(x: 0, y: 0, width: 320 * 0.78, height: Common.screenHeight)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 处理点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: false)
 
        let itemString = titlesDictionary[(indexPath as NSIndexPath).row]
//        var segueIdentifier:String = "showProfileView"
        
////        根据在菜单栏中点击选择的栏目跳转页面
//        switch itemString {
//            case "Home":
//                segueIdentifier = "showHomeView"
//            case "Profile":
//                segueIdentifier = "showProfileView"
//            case "Settings":
//                segueIdentifier = "showSettingsView"
//            case "Statistics":
//                segueIdentifier = "showStatisticsView"
//            case "Gear":
//                segueIdentifier = "showGearView"
//            case "Achievement":
//                segueIdentifier = "showAchievementView"
//            case "Map":
//                segueIdentifier = "showMapView"
//            case "My Story":
//                segueIdentifier = "showStoryView"
//            default:
//                segueIdentifier = "showMissionView"
//        }
//        总是会到最先的SlideViewController
        self.performSegue(withIdentifier: "showSlideView", sender: itemString)
        
    }
    
    //在这个方法中给新页面传递参数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSlideView"{
            let controller = segue.destination as! SlideViewController
            controller.itemString = sender as? String
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        There are 8 items in the menu
        return 8
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
    
        cell.backgroundColor = UIColor.clear
        cell.textLabel!.text = titlesDictionary[(indexPath as NSIndexPath).row]
    
        return cell
    }
    

 }
