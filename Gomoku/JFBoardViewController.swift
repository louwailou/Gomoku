//
//  JFBoardViewController.swift
//  Gomoku
//
//  Created by Sun on 2016/12/27.
//  Copyright © 2016年 Sun. All rights reserved.
//

import Foundation


class JFBoardViewController: UIViewController {
    
    private lazy var  boardView: JFContainerView = {
        let view = JFContainerView()
        return view
    }()
    
      let toolsView :UIView  = UIView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(toolsView)
        toolsView.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(self.view.snp.bottom)
            maker.left.right.equalToSuperview()
            maker.height.equalTo(45)
        }
        // 添加btn
        let leftBtn = UIButton(type:.custom)
        self.toolsView.addSubview(leftBtn)
        leftBtn.setTitle("落子", for: .normal)
        
        
        
        self.view.addSubview(boardView)
        boardView.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(self.toolsView.snp.top).offset(-10)
            maker.left.right.equalToSuperview()
            maker.height.equalTo(JFBoardSettings.screenWidth)
        }
        print(JFBoardSettings.screenWidth)
        
        
    }
    
    
}
