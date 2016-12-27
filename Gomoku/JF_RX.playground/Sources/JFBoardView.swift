import Foundation
import UIKit
import Snapkit


class JFBoardView: UIView {
    var gridWidth:CGFloat = 10.0
    var grideheight :CGFloat {
        get{
            return 10
        }
        set{
            self.grideheight = 11
        }
    }
    var factor :CGFloat = 0.3{
        willSet(newV){
            print("")
        }
        didSet{
            if factor > oldValue {
                print("didSet")
            }
        }
    }
    
    static var comupterType :String{
        return "dddd"
    }
    
    
    lazy var listData: [String]? = {
        ()->[String]
        in
        print("---")
        return ["a", "b", "why"]
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        backgroundColor =  UIColor(red: 0.1, green: 0.1, blue: 0.9, alpha: 0.4)
        
    }
    
}


class JFBoard: UIView {
    
//    override func drawRect(_ rect :CGRect){
//        var context:CGContextRef = UIGraphicsGetCurrentContext()
//        
//    }
}
