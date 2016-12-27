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
class ViewController: UIViewController {
   
    private var tabbarVC: UITabBarController {
        let tabVC = UITabBarController()
        let boardNav: UINavigationController = {
            
            let  boardVC :UIViewController = JFBoardViewController()
            
            let nav :UINavigationController = UINavigationController(rootViewController: boardVC)
            nav.tabBarItem = UITabBarItem(title: "首页", image: UIImage(named:"tab_bar_special_icon"), selectedImage: UIImage(named: "tab_bar_special_select_icon"))
            return nav
        }()
        
        let favoriteVC: UINavigationController = {
            
            let  boardVC :UIViewController = JFBoardViewController()
            
            let nav :UINavigationController = UINavigationController(rootViewController: boardVC)
            nav.tabBarItem = UITabBarItem(title: "喜欢", image: UIImage(named:"tab_bar_recommend_icon"), selectedImage: UIImage(named: "tab_bar_recommend_select_icon"))
            return nav
        }()
        
        let profileVC: UINavigationController = {
            
            let  boardVC :UIViewController = JFBoardViewController()
            
            let nav :UINavigationController = UINavigationController(rootViewController: boardVC)
            nav.tabBarItem = UITabBarItem(title: "设置", image: UIImage(named:"tab_bar_profile_icon"), selectedImage: UIImage(named: "tab_bar_profile_select_icon"))
            return nav
        }()
        
        tabVC.setViewControllers([boardNav,favoriteVC,profileVC], animated: true)
        
        return tabVC
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
       self.view.addSubview(tabbarVC.view)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
}



