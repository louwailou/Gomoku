//
//  JFHomeViewController.swift
//  Gomoku
//
//  Created by Sun on 2016/12/29.
//  Copyright © 2016年 Sun. All rights reserved.
//

import Foundation
class  JFHomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let actionBtn = UIButton.init(type: .custom)
        self.view.addSubview(actionBtn)
        actionBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 60, height: 40))
        }
        actionBtn.backgroundColor = UIColor.blue
        actionBtn.setTitle("定式", for: .normal)
        actionBtn.addTarget(self, action: #selector(pushBoardVC), for: UIControlEvents.touchUpInside)
    }
    func pushBoardVC(){
        let boardVC = JFBoardViewController()
        boardVC.hidesBottomBarWhenPushed = true
       // self.navigationController?.present(boardVC, animated: true, completion:nil)
        self.navigationController?.pushViewController(boardVC, animated: true)
    }
}
