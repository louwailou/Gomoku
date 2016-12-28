//
//  JFBoardSetting.swift
//  Gomoku
//
//  Created by Sun on 2016/12/28.
//  Copyright © 2016年 Sun. All rights reserved.
//

import Foundation
class Env {
    
    static var iPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    
}

struct JFBoardSettings {
    static let boardColor:UIColor = UIColor.brown
    static var  boardWidth : CGFloat {
       return UIScreen.main.bounds.size.width - boardLeftMargin - boardRightMargin
    }
    
    static var  boardLeftMargin : CGFloat {
        if Env.iPad {
            return 40.0
        }else{
            return 20.0
        }
    }
    
    static var  boardBottomMargin : CGFloat {
        if Env.iPad {
            return 40.0
        }else{
            return 20.0
        }
    }
    static var  boardRightMargin : CGFloat {
        if Env.iPad {
            return 10.0
        }else{
            return 5.0
        }
    }
    static var font :UIFont {
        if Env.iPad {
            return UIFont.systemFont(ofSize: 14)
        }else{
            return UIFont.systemFont(ofSize: 30)
        }
    }
    
    static let lineColor : UIColor = UIColor.black
    static var lineHeight : CGFloat {
        if Env.iPad {
            return 4
        }else{
            return 2
        }
    }
    // 棋盘 标注
    static let xAxis = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","o"]
    static let yAxis = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    
    
}
