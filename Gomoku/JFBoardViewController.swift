//
//  JFBoardViewController.swift
//  Gomoku
//
//  Created by Sun on 2016/12/27.
//  Copyright © 2016年 Sun. All rights reserved.
//

import Foundation


class JFBoardViewController: UIViewController {
    
    private lazy var  boardView: JFBoardView = {
        let view = JFBoardView()
        view.backgroundColor = UIColor.brown
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(boardView)
        boardView.snp.makeConstraints { (maker) in
            maker.bottom.equalToSuperview()
            maker.left.right.equalToSuperview()
            maker.height.equalTo(400)
        }
    }
    
    
}
