//
//  JFModel.swift
//  Gomoku
//
//  Created by Sun on 2016/12/23.
//  Copyright © 2016年 Sun. All rights reserved.
//

import Foundation

struct JFPoint {
    var x: Float
    var y: Float
    
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
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
   // public static func <=(lhs: Self, rhs: Self) -> Bool
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
   // public static func >=(lhs: Self, rhs: Self) -> Bool
    
   
    public static func >(lhs: JFPoint, rhs: JFPoint) -> Bool{
         return lhs.x > rhs.x && lhs.y >  rhs.y;
    }
}

// 节点

class JFNode  {
    var point:JFPoint = JFPoint(x: 0, y: 0)
    var comment:String? = nil
    var subNodes:Array<JFNode> = NSArray() as! Array<JFNode>
    var parent:JFNode? = nil
    
}

// 装饰模式
protocol Product{
    var name:String {get set}
    var price:Int {get set}
    
}

protocol Salteable:Product {
    func salted()->Self
}

extension Salteable{
    func salted()->Self {
        var newProduct = self
        newProduct.name = "加盐\(name)"
        newProduct.price = price + 1
        return newProduct
    }
}


struct Snack: CustomStringConvertible {
    
    var name: String
    var price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    var description: String {
        get {
            return "\(name): \(price)元"
        }
    }
}

extension Snack: Salteable { }
/*
位置关系       无其它    只有     只有棋盘    只有     有标记    有注释    有棋盘文字   三者
               信息    注释       文字       标记    和注释   和棋盘文字   和标记    都有
有儿子无兄弟	    00	   08      	01	       10	   18	    09	     11	       19
有右兄弟有儿子   	80	   88      	81         90	   98      	89	     91	       99
只有右兄弟无儿子   C0	    C8      C1      	D0      D8     	C9	     D1	       D9
分枝中最后一叶子   40	    48	     41	        50      58     	49	     51	       59
*/

enum JFNodeRelationType :String{
    case none = "00"
    case Comment = "08"
    case BoardText = "01"
    case BoardFlag = "10"
    case BoardFlagAndComment = "18"  // 读 08 注释 00
    case BoardTextAndComment = "09"
    case BoardTextAndFlag = "11"
    case All    = "19"
    
    
}



