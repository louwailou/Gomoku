//
//  JFChessModel.swift
//  Gomoku
//
//  Created by Sun on 2016/12/28.
//  Copyright © 2016年 Sun. All rights reserved.
//

import Foundation

struct JFPoint {
    var x: Float = 0.0
    var y: Float = 0.0
    
}

extension JFPoint:CustomStringConvertible{
    var description:String{
        return "(x:\(self.x) y:\(self.y))"
    }
}

extension JFPoint:Equatable,Comparable{
    static func == (lp:JFPoint,rp:JFPoint)->Bool{
        let equalx = lp.x == rp.x
        let equaly = lp.y == rp.y
        return equalx&&equaly
        
    }
    public static func <(lhs: JFPoint, rhs: JFPoint) -> Bool{
        return lhs.x < rhs.x && lhs.y < rhs.y;
    }
   
    
    public static func >(lhs: JFPoint, rhs: JFPoint) -> Bool{
        return lhs.x > rhs.x && lhs.y >  rhs.y;
    }
}

struct JFNodeImage {
   static let white : UIImage = UIImage(named: "white")!
   static let black :UIImage = UIImage(named: "black")!
    
}

struct  JFSize {
    var width = JFBoardSettings.cellWidth
    var height = JFBoardSettings.cellHeight
    
}

class JFNode  {
    var point:JFPoint = JFPoint(x: 0, y: 0)
    var size:JFSize = JFSize()
    var image:JFNodeImage?
    var comment:String? = nil
    var subNodes:Array<JFNode> = NSArray() as! Array<JFNode>
    var parent:JFNode? = nil
    var isWhite = false
    
}
