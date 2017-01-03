import Foundation
import UIKit



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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class JFBoard: UIView {
    
    
    override init(frame:CGRect) {
        
        super.init(frame:frame)
        self.setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    func setup() {
//        let image  = renderer.image { context in
//            let bounds = context.format.bounds
//            
//            
//        }
    }
}

extension RandomAccessCollection {
    func random() -> Iterator.Element? {
        guard count > 0 else { return nil }
        let offset = arc4random_uniform(numericCast(count))
        let i = index(startIndex, offsetBy: numericCast(offset))
        return self[i]
    }
}

//extension UIImage {
//    public func grayScaled() -> UIImage? {
//        guard let cgImage = cgImage else {
//            return nil
//        }
//        let colorSpace = CGColorSpaceCreateDeviceGray()
//        let (width,height) = (Int(size.width),Int(size.height))
//        guard let context = CGContext()
//             else { return nil }
//    }
//}


/// - 返回: 从 `rhs` 到 `lhs`的向量。
func -(lhs: CGPoint, rhs: CGPoint) -> CGVector
{
    return CGVector(dx: lhs.x - rhs.x, dy: lhs.y - rhs.y)
}

// - 返回: `lhs` 偏移`rhs` 之后得到的一个点
func +(lhs: CGPoint, rhs: CGVector) -> CGPoint
{
    return CGPoint(x: lhs.x + rhs.dx, y: lhs.y + rhs.dy)
}

/*
 // 触摸开始:
 objectOffset = object.center - touch.locationInView(container)
 
 // 触摸移动:
 object.center = touch.locationInView(container) + objectOffset

 
 */
