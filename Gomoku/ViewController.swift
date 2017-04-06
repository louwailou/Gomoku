//
//  ViewController.swift
//  Gomoku
//
//  Created by Sun on 2016/12/21.
//  Copyright © 2016年 Sun. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit
import CrashEye
import Log4G

class ViewController: UIViewController,UITabBarControllerDelegate {
   
    
     var tabbarVC: UITabBarController = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let boardNav: UINavigationController = {
            
            let  boardVC :UIViewController = JFHomeViewController()
            boardVC.title = "首页"
            let nav :UINavigationController = UINavigationController(rootViewController: boardVC)
            nav.tabBarItem = UITabBarItem(title: "首页", image: UIImage(named:"tab_bar_special_icon"), selectedImage: UIImage(named: "tab_bar_special_select_icon"))
            return nav
        }()
        
        let favoriteVC: UINavigationController = {
            
            let  boardVC :UIViewController = JFFavoriteViewController()
            boardVC.title = "我的收藏"
            let nav :UINavigationController = UINavigationController(rootViewController: boardVC)
            nav.tabBarItem = UITabBarItem(title: "喜欢", image: UIImage(named:"tab_bar_recommend_icon"), selectedImage: UIImage(named: "tab_bar_recommend_select_icon"))
            return nav
        }()
        
        let profileVC: UINavigationController = {
            
            let  boardVC :UIViewController = JFProfileViewController()
            boardVC.title = "设置"
            let nav :UINavigationController = UINavigationController(rootViewController: boardVC)
            nav.tabBarItem = UITabBarItem(title: "设置", image: UIImage(named:"tab_bar_profile_icon"), selectedImage: UIImage(named: "tab_bar_profile_select_icon"))
            return nav
        }()
        tabbarVC.addChildViewController(boardNav)
        tabbarVC.addChildViewController(favoriteVC)
        tabbarVC.addChildViewController(profileVC)
        
        tabbarVC.delegate = self
       self.view.addSubview(self.tabbarVC.view)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Log4G.log("just log")
        
        DispatchQueue.global().async {
            Log4G.warning("just warning")
        }
        
        Log4G.error("just error")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}



