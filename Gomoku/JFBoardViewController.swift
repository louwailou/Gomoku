//
//  JFcontainerViewController.swift
//  Gomoku
//
//  Created by Sun on 2016/12/27.
//  Copyright © 2016年 Sun. All rights reserved.
//

import Foundation


class JFBoardViewController: UIViewController {
    
    private lazy var  containerView: JFContainerView = {
        let view = JFContainerView()
        return view
    }()
    
      let toolsView :UIView  = UIView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(toolsView)
        toolsView.backgroundColor = UIColor.lightGray
        toolsView.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(self.view.snp.bottom)
            maker.left.right.equalToSuperview()
            maker.height.equalTo(45)
        }
        // 添加btn
        let leftBtn = UIButton(type:.custom)
        self.toolsView.addSubview(leftBtn)
        leftBtn.setTitle("上一步", for: .normal)
        leftBtn.snp.makeConstraints { (maker) in
            maker.centerY.equalToSuperview()
            maker.left.equalToSuperview().offset(10)
            maker.height.equalTo(40)
        }
        
        
        let nextBtn = UIButton(type:.custom)
        self.toolsView.addSubview(nextBtn)
        nextBtn.setTitle("下一步", for: .normal)
        nextBtn.snp.makeConstraints { (maker) in
            maker.centerY.equalToSuperview()
            maker.left.equalTo(leftBtn.snp.right).offset(10)
            maker.height.equalTo(40)
        }
        
        let cancelBtn = UIButton(type:.custom)
        self.toolsView.addSubview(cancelBtn)
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.snp.makeConstraints { (maker) in
            maker.centerY.equalToSuperview()
            maker.left.equalTo(nextBtn.snp.right).offset(10)
            maker.height.equalTo(40)
        }
        
        self.view.addSubview(containerView)
        containerView.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(self.toolsView.snp.top)
            maker.left.right.equalToSuperview()
            maker.height.equalTo(JFBoardSettings.screenWidth)
        }
        
        
        
    }
    
    
}
