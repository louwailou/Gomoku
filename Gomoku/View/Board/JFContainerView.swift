//
//  JFNodeView.swift
//  Gomoku
//
//  Created by Sun on 2017/1/4.
//  Copyright © 2017年 Sun. All rights reserved.
//

import Foundation
class JFContainerView: UIView {
   // var bgView :UIImageView  = UIImageView(image: UIImage(named: "board"))
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
//        self.addSubview(bgView)
//        bgView.snp.makeConstraints { (maker) in
//            maker.edges.equalToSuperview()
//        }
        // 添加board view
       let board = JFBoardView()
        self.addSubview(board)
        board.backgroundColor = UIColor.clear
        board.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        };
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
