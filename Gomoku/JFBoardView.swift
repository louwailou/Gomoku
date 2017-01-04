//
//  JFBoardView.swift
//  Gomoku
//
//  Created by Sun on 2016/12/26.
//  Copyright © 2016年 Sun. All rights reserved.
//

import Foundation
import UIKit
class JFBoardView :UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesutre))
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
     super.draw(rect)
        
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        let color = UIColor.black
        context.setStrokeColor(color.cgColor)
        context.setLineWidth(JFBoardSettings.lineHeight)
        
        let bg = UIImage(named: "board")
        bg?.draw(in: self.bounds)
        
        let  minX =  JFBoardSettings.boardLeftMargin
        let  minY =   JFBoardSettings.boardTopMargin
        let maxX =  JFBoardSettings.boardWidth + minX
        let maxY =  minY + JFBoardSettings.boardHeight
        let cellHeight = JFBoardSettings.cellHeight
        
    
       context.setStrokeColor(UIColor.red.cgColor)
        // horizontal lines
        for hIndex in 0..<JFBoardSettings.chesslayoutCount  {
            let baseY = maxY - cellHeight * CGFloat(hIndex)
            context.move(to: CGPoint(x:minX, y:baseY ))
            context.addLine(to: CGPoint(x:maxX , y: baseY))
            let hFlag = JFBoardSettings.yAxis[hIndex]
           
           
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.right
            let attributedDictonary = [NSForegroundColorAttributeName:UIColor.black, NSParagraphStyleAttributeName:paragraphStyle] as [String : Any]
            let attributeString = NSAttributedString(string: hFlag, attributes: attributedDictonary)
            attributeString.draw(at: CGPoint(x: 2, y: maxY - cellHeight * CGFloat(hIndex) - 5))
        }
       
        // vertical lines
        context.setStrokeColor(color.cgColor)
        
        for vIndex in 0..<JFBoardSettings.chesslayoutCount  {
            let baseX = minX + cellHeight * CGFloat(vIndex)
            context.move(to: CGPoint(x:baseX, y: maxY  ))
            context.addLine(to: CGPoint(x: baseX, y: minY ))
            let vFlag = JFBoardSettings.xAxis[vIndex]
           
            
           
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.center
            let attributedDictonary = [NSForegroundColorAttributeName:UIColor.black, NSParagraphStyleAttributeName:paragraphStyle] as [String : Any]
            let attributeString = NSAttributedString(string: vFlag, attributes: attributedDictonary)
            attributeString.draw(at: CGPoint(x:  minX + cellHeight * CGFloat(vIndex) - 2, y: maxY))
          
        }
     
        context.strokePath()
        
      
    }
    //点击事件
    func tapGesutre(_ gesture:UITapGestureRecognizer){
        let point = gesture.location(in: gesture.view)
        // 计算行列位置
        print("x = \(point.x)")
        
        
    }
    // 获取棋子
    func nodeLayer(isWhite:Bool)-> CAShapeLayer{
        let node = CAShapeLayer()
        if isWhite {
           node.contents = JFNodeImage.white
        }else{
           node.contents = JFNodeImage.black
        }
        return node
    }
    
   

}
