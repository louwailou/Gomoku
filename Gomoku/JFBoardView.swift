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
            context.addLine(to: CGPoint(x: JFBoardSettings.boardWidth, y: baseY - cellHeight * CGFloat(hIndex)))
            let hFlag = JFBoardSettings.yAxis[hIndex]
           
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.center
            let attributedDictonary = [NSForegroundColorAttributeName:UIColor.black, NSParagraphStyleAttributeName:paragraphStyle] as [String : Any]
            let attributeString = NSAttributedString(string: hFlag, attributes: attributedDictonary)
            attributeString.draw(at: CGPoint(x: 2, y: baseY - cellHeight * CGFloat(hIndex) - 5))
        }
       
        
           // let textAttributes = [NSWritingDirectionAttributeName : NSWritingDirection.rightToLeft.rawValue]
        // vertical lines
        
        for vIndex in 0..<JFBoardSettings.chesslayoutCount  {
            context.move(to: CGPoint(x:baseX + cellHeight * CGFloat(vIndex), y: baseY  ))
            context.addLine(to: CGPoint(x: baseX + cellHeight * CGFloat(vIndex), y: JFBoardSettings.boardBottomMargin ))
            let vFlag = JFBoardSettings.xAxis[vIndex]
           
            
           
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.center
            let attributedDictonary = [NSForegroundColorAttributeName:UIColor.black, NSParagraphStyleAttributeName:paragraphStyle] as [String : Any]
            let attributeString = NSAttributedString(string: vFlag, attributes: attributedDictonary)
            attributeString.draw(at: CGPoint(x:  baseX + cellHeight * CGFloat(vIndex), y: baseY))
          
        }
     
        context.strokePath()
    }
    func setup()-> Void{
        self.backgroundColor = UIColor.brown
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
   override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
