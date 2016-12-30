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
        
        setup()
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
        
        let  baseX =  JFBoardSettings.boardLeftMargin
        let cellHeight = JFBoardSettings.cellHeight
        let baseY = self.height - JFBoardSettings.boardBottomMargin
        // horizontal lines
        for hIndex in 0..<JFBoardSettings.chesslayoutCount  {
            context.move(to: CGPoint(x:baseX, y: baseY - cellHeight * CGFloat(hIndex)))
            context.addLine(to: CGPoint(x: baseX+JFBoardSettings.boardWidth, y: baseY - cellHeight * CGFloat(hIndex)))
            let hFlag = JFBoardSettings.yAxis[hIndex]
           let str = NSString.init(string: hFlag)
             let stringRect = CGRect(x: baseX - 20 , y: baseY - cellHeight * CGFloat(hIndex), width: JFBoardSettings.fontSize, height: JFBoardSettings.fontSize)
            str.draw(in: stringRect, withAttributes: nil)
        }
       
        
           // let textAttributes = [NSWritingDirectionAttributeName : NSWritingDirection.rightToLeft.rawValue]
        // vertical lines
        for vIndex in 0..<JFBoardSettings.chesslayoutCount  {
            context.move(to: CGPoint(x:baseX + cellHeight * CGFloat(vIndex), y: baseY  ))
            context.addLine(to: CGPoint(x: baseX + cellHeight * CGFloat(vIndex), y: baseY - JFBoardSettings.boardHeight ))
            let vFlag = JFBoardSettings.xAxis[vIndex]
            let str = NSString.init(string: vFlag)
            let stringRect = CGRect(x: baseX + cellHeight * CGFloat(vIndex), y: baseY , width: JFBoardSettings.fontSize, height: JFBoardSettings.fontSize)
            str.draw(in: stringRect, withAttributes: nil)
        }
     
        context.strokePath()
    }
    func setup()-> Void{
        
    }
}
