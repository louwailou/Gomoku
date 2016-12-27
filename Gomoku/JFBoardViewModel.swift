//
//  JFBoardViewModel.swift
//  Gomoku
//
//  Created by Sun on 2016/12/23.
//  Copyright © 2016年 Sun. All rights reserved.
//

import Foundation
struct JFHelper {
    
    var factor:CGFloat {
        get{
            return 1.0 * 0.8;
        }
        set(newValue){
            self.factor = newValue
        }
    }
    let  screenWidth :CGFloat = UIScreen.main.bounds.size.width
    let  ratio :CGFloat = 0.8
    let kGridCount = 15
    let kChessSpace = 20.0
}
