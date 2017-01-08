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
        let cellHeight = JFBoardSettings.cellHeight
        let  minX :CGFloat =  cellHeight
        let  minY:CGFloat =  cellHeight
        let maxX :CGFloat =  self.width - minX
        let maxY :CGFloat =  self.height - minY
        
        // horizontal lines
        for hIndex in 0..<JFBoardSettings.chesslayoutCount  {
            let baseY = maxY - cellHeight * CGFloat(hIndex)
            context.move(to: CGPoint(x:minX, y:baseY ))
            context.addLine(to: CGPoint(x:maxX , y: baseY))
        }
       
        // vertical lines
        context.setStrokeColor(color.cgColor)
        
        for vIndex in 0..<JFBoardSettings.chesslayoutCount  {
            let baseX = minX + cellHeight * CGFloat(vIndex)
            context.move(to: CGPoint(x:baseX, y: maxY  ))
            context.addLine(to: CGPoint(x: baseX, y: minY ))
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
