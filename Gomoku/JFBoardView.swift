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
    let cellHeight = JFBoardSettings.cellHeight
    var  minX :CGFloat  {
       return cellHeight
    }
    var  minY:CGFloat {
        return cellHeight
    }
    var  maxX :CGFloat {
        return self.width - minX
    }
    var  maxY :CGFloat {
      return self.height - minY
    }
    
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
        
        
        // horizontal lines
        for hIndex in 0..<JFBoardSettings.chesslayoutCount  {
            let baseY = maxY - cellHeight * CGFloat(hIndex)
            context.move(to: CGPoint(x:minX, y:baseY ))
            context.addLine(to: CGPoint(x:maxX , y: baseY))
        }
       
        // vertical lines
        
        for vIndex in 0..<JFBoardSettings.chesslayoutCount  {
            let baseX = minX + cellHeight * CGFloat(vIndex)
            context.move(to: CGPoint(x:baseX, y: maxY  ))
            context.addLine(to: CGPoint(x: baseX, y: minY ))
        }
        
        context.strokePath()
        
        // d4 d12  L4  L12  h8
        let pointWidth = JFBoardSettings.pointCenter
        
        context.setFillColor(color.cgColor)
        
        context.addEllipse(in: CGRect(x: CGFloat(4) * cellHeight - pointWidth/2, y: maxY - CGFloat(3) * cellHeight - pointWidth/2, width: pointWidth, height: pointWidth))
        
        // d12
         context.addEllipse(in: CGRect(x: CGFloat(4) * cellHeight - pointWidth/2, y: maxY - CGFloat(11) * cellHeight - pointWidth/2, width: pointWidth, height: pointWidth))
        
        // L4  L12
         context.addEllipse(in: CGRect(x: CGFloat(12) * cellHeight - pointWidth/2, y: maxY - CGFloat(3) * cellHeight - pointWidth/2, width: pointWidth, height: pointWidth))
        
         context.addEllipse(in: CGRect(x: CGFloat(12) * cellHeight - pointWidth/2, y: maxY - CGFloat(11) * cellHeight - pointWidth/2, width: pointWidth, height: pointWidth))
        
        // H8
         context.addEllipse(in: CGRect(x: CGFloat(8) * cellHeight - pointWidth/2, y: maxY - CGFloat(7) * cellHeight - pointWidth/2, width: pointWidth, height: pointWidth))
        context.fillPath()
        
      
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
