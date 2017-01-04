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
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    
    static let chesslayoutCount = 15
    
    static var  boardWidth : CGFloat {
       return screenWidth - boardLeftMargin - boardRightMargin
    }
    
    static var cellWidth: CGFloat {
        return self.boardWidth / CGFloat(self.chesslayoutCount)
    }
    static var cellHeight = cellWidth
    
    static var  boardHeight : CGFloat {
        return self.boardWidth
    }
    
    static var  boardLeftMargin : CGFloat {
        if Env.iPad {
            return 40.0
        }else{
            return 20.0
        }
    }
    static var  boardTopMargin : CGFloat {
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
            return 6.0
        }
    }
    static  var fontSize :CGFloat  {
        if Env.iPad {
            return  14.0
        }else{
            return 30.0
        }
    }
    static var font :UIFont =  UIFont.systemFont(ofSize: fontSize)
    
    static let lineColor : UIColor = UIColor.black
    static var lineHeight : CGFloat {
        if Env.iPad {
            return 2
        }else{
            return 1
        }
    }
    // 棋盘 标注
    static let xAxis = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O"]
    static let yAxis = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    static var scaleFactor = 1.0
    
}
