//
//  SlideViewController.swift
//  OneDay
//
//  Created by Shuoqi Chen on 11/23/16.
//  Copyright © 2016 Shuoqi Chen. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController {
    
    // 该 TabBar Controller 不是传统意义上的容器，在此只负责提供 UITabBar 这个 UI 组件
//    var mainTabBarController: MainTabBarController!
    var mainPageViewController: MainPageViewController!
    
    // 主界面点击手势，用于在菜单划出状态下点击主页后自动关闭菜单
    var tapGesture: UITapGestureRecognizer!
    
    // 首页中间的主要视图的来源
    var itemString: String!
    
    // 侧滑菜单视图的来源
    var leftMenuViewController: LeftMenuViewController!
    
    // 构造主视图，实现 UINavigationController.view 和 HomeViewController.view 一起缩放
    var mainView: UIView!
    
    // 侧滑所需参数
    var distance: CGFloat = 0
    let FullDistance: CGFloat = 0.78
    let Proportion: CGFloat = 0.77
    var centerOfLeftViewAtBeginning: CGPoint!
    var proportionOfLeftView: CGFloat = 1
    var distanceOfLeftView: CGFloat = 50
    
    // 侧滑菜单黑色半透明遮罩层
    var blackCover: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 给根容器设置背景 (imageView?)
        let imageView = UIImageView(image: UIImage(named: "back"))
        imageView.frame = UIScreen.main.bounds
        self.view.addSubview(imageView)
        
        // 通过 StoryBoard 取出左侧侧滑菜单视图
        leftMenuViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LeftMenuViewController") as! LeftMenuViewController
        // 适配 4.7 和 5.5 寸屏幕的缩放操作，有偶发性小 bug
        if Common.screenWidth > 320 {
            proportionOfLeftView = Common.screenWidth / 320
            distanceOfLeftView += (Common.screenWidth - 320) * FullDistance / 2
        }
        leftMenuViewController.view.center = CGPoint(x: leftMenuViewController.view.center.x - 50, y: leftMenuViewController.view.center.y)
        leftMenuViewController.view.transform = CGAffineTransform.identity.scaledBy(x: 0.8, y: 0.8)
        
        // 动画参数初始化
        centerOfLeftViewAtBeginning = leftMenuViewController.view.center
        // 把侧滑菜单视图加入根容器
        self.view.addSubview(leftMenuViewController.view)
        
        // 在侧滑菜单之上增加黑色遮罩层，目的是实现视差特效
        blackCover = UIView(frame: self.view.frame.offsetBy(dx: 0, dy: 0))
        blackCover.backgroundColor = UIColor.black
        self.view.addSubview(blackCover)
        
        // 初始化主视图，即包含 TabBar、NavigationBar和首页的总视图
        mainView = UIView(frame: self.view.frame)
        
        // 初始化 mainPageViewController
        let storyBoard = UIStoryboard(name:"Main", bundle: nil)
        
        mainPageViewController = storyBoard.instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
        
        // 取出 ??? Controller 的视图加入主视图
        let pageView = mainPageViewController.view
        mainView.addSubview(pageView!)
   
     
        //=========================================================================================================
       
//      调取用户当前所在的页面
        if (itemString == nil) {
//            itemString = "Mission"
            itemString = "Profile"
        }
        
        switch itemString {
        case "Home":
            //=========================================================================================================
                let homeViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                
                // 分别将 Navigation Bar 和 homeViewController 的视图加入 TabBar Controller 的视图
//                tabBarView?.addSubview(homeViewController.view)
                pageView?.addSubview(homeViewController.view)
                
                // 给主视图绑定 UIPanGestureRecognizer
                let panGesture = homeViewController.panGesture
                panGesture?.addTarget(self, action: #selector(SlideViewController.pan(_:)))
                mainView.addGestureRecognizer(panGesture!)
            //=========================================================================================================
        case "Profile":
            //=========================================================================================================
            let homeViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
            
            // 分别将 Navigation Bar 和 homeViewController 的视图加入 TabBar Controller 的视图
//            tabBarView?.addSubview(homeViewController.view)
            pageView?.addSubview(homeViewController.view)
            
            // 给主视图绑定 UIPanGestureRecognizer
            let panGesture = homeViewController.panGesture
            panGesture?.addTarget(self, action: #selector(SlideViewController.pan(_:)))
            mainView.addGestureRecognizer(panGesture!)
        //=========================================================================================================
        case "Mission":
            //=========================================================================================================
            let homeViewController = storyBoard.instantiateViewController(withIdentifier: "MissionViewController") as! MissionViewController
            
            // 分别将 Navigation Bar 和 homeViewController 的视图加入 TabBar Controller 的视图
            pageView?.addSubview(homeViewController.view)
            
            // 给主视图绑定 UIPanGestureRecognizer
            let panGesture = homeViewController.panGesture
            panGesture?.addTarget(self, action: #selector(SlideViewController.pan(_:)))
            mainView.addGestureRecognizer(panGesture!)
            //=========================================================================================================
        case "Settings":
            //=========================================================================================================
            let homeViewController = storyBoard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            
            // 分别将 Navigation Bar 和 homeViewController 的视图加入 TabBar Controller 的视图
            pageView?.addSubview(homeViewController.view)
            
            // 给主视图绑定 UIPanGestureRecognizer
            let panGesture = homeViewController.panGesture
            panGesture?.addTarget(self, action: #selector(SlideViewController.pan(_:)))
            mainView.addGestureRecognizer(panGesture!)
            //=========================================================================================================
        case "Statistics":
            //=========================================================================================================
            let homeViewController = storyBoard.instantiateViewController(withIdentifier: "StatisticsViewController") as! StatisticsViewController
            
            // 分别将 Navigation Bar 和 homeViewController 的视图加入 TabBar Controller 的视图
            pageView?.addSubview(homeViewController.view)
            
            // 给主视图绑定 UIPanGestureRecognizer
            let panGesture = homeViewController.panGesture
            panGesture?.addTarget(self, action: #selector(SlideViewController.pan(_:)))
            mainView.addGestureRecognizer(panGesture!)
            //=========================================================================================================
        case "Gear":
            //=========================================================================================================
            let homeViewController = storyBoard.instantiateViewController(withIdentifier: "GearViewController") as! GearViewController
            
            // 分别将 Navigation Bar 和 homeViewController 的视图加入 TabBar Controller 的视图
            pageView?.addSubview(homeViewController.view)
            
            // 给主视图绑定 UIPanGestureRecognizer
            let panGesture = homeViewController.panGesture
            panGesture?.addTarget(self, action: #selector(SlideViewController.pan(_:)))
            mainView.addGestureRecognizer(panGesture!)
            //=========================================================================================================
        case "Achievement":
            //=========================================================================================================
            let homeViewController = storyBoard.instantiateViewController(withIdentifier: "AchievementViewController") as! AchievementViewController
            
            // 分别将 Navigation Bar 和 homeViewController 的视图加入 TabBar Controller 的视图
            pageView?.addSubview(homeViewController.view)
            
            // 给主视图绑定 UIPanGestureRecognizer
            let panGesture = homeViewController.panGesture
            panGesture?.addTarget(self, action: #selector(SlideViewController.pan(_:)))
            mainView.addGestureRecognizer(panGesture!)
            //=========================================================================================================
        case "Map":
            //=========================================================================================================
            let homeViewController = storyBoard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
            
            // 分别将 Navigation Bar 和 homeViewController 的视图加入 TabBar Controller 的视图
            pageView?.addSubview(homeViewController.view)
            
            // 给主视图绑定 UIPanGestureRecognizer
            let panGesture = homeViewController.panGesture
            panGesture?.addTarget(self, action: #selector(SlideViewController.pan(_:)))
            mainView.addGestureRecognizer(panGesture!)
            //=========================================================================================================
        case "My Story":
            //=========================================================================================================
            let homeViewController = storyBoard.instantiateViewController(withIdentifier: "StoryViewController") as! StoryViewController
            
            // 分别将 Navigation Bar 和 homeViewController 的视图加入 TabBar Controller 的视图
            pageView?.addSubview(homeViewController.view)
            
            // 给主视图绑定 UIPanGestureRecognizer
            let panGesture = homeViewController.panGesture
            panGesture?.addTarget(self, action: #selector(SlideViewController.pan(_:)))
            mainView.addGestureRecognizer(panGesture!)
            //=========================================================================================================
        default:
            //=========================================================================================================
            let homeViewController = storyBoard.instantiateViewController(withIdentifier: "MissionViewController") as! MissionViewController
            
            // 分别将 Navigation Bar 和 homeViewController 的视图加入 TabBar Controller 的视图
            pageView?.addSubview(homeViewController.view)
            
            // 给主视图绑定 UIPanGestureRecognizer
            let panGesture = homeViewController.panGesture
            panGesture?.addTarget(self, action: #selector(SlideViewController.pan(_:)))
            mainView.addGestureRecognizer(panGesture!)
            //=========================================================================================================
        }
        
        // 将主视图加入容器
        self.view.addSubview(mainView)
        
        // 生成单击收起菜单手势
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(SlideViewController.showHome))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 响应 UIPanGestureRecognizer 事件
    func pan(_ recongnizer: UIPanGestureRecognizer) {
        let x = recongnizer.translation(in: self.view).x
        let trueDistance = distance + x // 实时距离
        let trueProportion = trueDistance / (Common.screenWidth*FullDistance)
        
        // 如果 UIPanGestureRecognizer 结束，则激活自动停靠
        if recongnizer.state == UIGestureRecognizerState.ended {
            
            if trueDistance > Common.screenWidth * (Proportion / 3) {
                showLeft()
            } else if trueDistance < Common.screenWidth * -(Proportion / 3) {
                showRight()
            } else {
                showHome()
            }
            return
        }
        
        // 计算缩放比例
        var proportion: CGFloat = recongnizer.view!.frame.origin.x >= 0 ? -1 : 1
        proportion *= trueDistance / Common.screenWidth
        proportion *= 1 - Proportion
        proportion /= FullDistance + Proportion/2 - 0.5
        proportion += 1
        if proportion <= Proportion { // 若比例已经达到最小，则不再继续动画
            return
        }
        // 执行视差特效
        blackCover.alpha = (proportion - Proportion) / (1 - Proportion)
        // 执行平移和缩放动画
        recongnizer.view!.center = CGPoint(x: self.view.center.x + trueDistance, y: self.view.center.y)
        recongnizer.view!.transform = CGAffineTransform.identity.scaledBy(x: proportion, y: proportion)
        
        // 执行左视图动画
        let pro = 0.8 + (proportionOfLeftView - 0.8) * trueProportion
        leftMenuViewController.view.center = CGPoint(x: centerOfLeftViewAtBeginning.x + distanceOfLeftView * trueProportion, y: centerOfLeftViewAtBeginning.y - (proportionOfLeftView - 1) * leftMenuViewController.view.frame.height * trueProportion / 2 )
        leftMenuViewController.view.transform = CGAffineTransform.identity.scaledBy(x: pro, y: pro)
    }
    
    // 封装三个方法，便于后期调用
    
    // 展示左视图
    func showLeft() {
        // 给首页 加入 点击自动关闭侧滑菜单功能
        mainView.addGestureRecognizer(tapGesture)
        // 计算距离，执行菜单自动滑动动画
        distance = self.view.center.x * (FullDistance*2 + Proportion - 1)
        doTheAnimate(self.Proportion, showWhat: "left")
    }
    // 展示主视图
    func showHome() {
        // 从首页 删除 点击自动关闭侧滑菜单功能
        mainView.removeGestureRecognizer(tapGesture)
        // 计算距离，执行菜单自动滑动动画
        distance = 0
        doTheAnimate(1, showWhat: "home")
    }
    // 展示右视图
    func showRight() {
        // 给首页 加入 点击自动关闭侧滑菜单功能
        mainView.addGestureRecognizer(tapGesture)
        // 计算距离，执行菜单自动滑动动画
        distance = self.view.center.x * -(FullDistance*2 + Proportion - 1)
        doTheAnimate(self.Proportion, showWhat: "right")
    }
    // 执行三种动画：显示左侧菜单、显示主页、显示右侧菜单
    func doTheAnimate(_ proportion: CGFloat, showWhat: String) {
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            // 移动首页中心
            self.mainView.center = CGPoint(x: self.view.center.x + self.distance, y: self.view.center.y)
            // 缩放首页
            self.mainView.transform = CGAffineTransform.identity.scaledBy(x: proportion, y: proportion)
            if showWhat == "left" {
                // 移动左侧菜单的中心
                self.leftMenuViewController.view.center = CGPoint(x: self.centerOfLeftViewAtBeginning.x + self.distanceOfLeftView, y: self.leftMenuViewController.view.center.y)
                // 缩放左侧菜单
                self.leftMenuViewController.view.transform = CGAffineTransform.identity.scaledBy(x: self.proportionOfLeftView, y: self.proportionOfLeftView)
            }
            // 改变黑色遮罩层的透明度，实现视差效果
            self.blackCover.alpha = showWhat == "home" ? 1 : 0
            
            // 为了演示效果，在右侧菜单划出时隐藏漏出的左侧菜单，并无实际意义
            self.leftMenuViewController.view.alpha = showWhat == "right" ? 0 : 1
        }, completion: nil)
    }
    

}
