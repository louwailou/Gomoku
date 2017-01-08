//
//  JFNodeView.swift
//  Gomoku
//
//  Created by Sun on 2017/1/4.
//  Copyright © 2017年 Sun. All rights reserved.
//

import Foundation
class JFContainerView: UIView {
   // var bgView :UIImageView  = UIImageView(image: UIImage(named: "board"))
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        // 添加board view
        self.backgroundColor = UIColor.clear
       let board = JFBoardView()
        self.addSubview(board)
        board.backgroundColor = UIColor.white
        board.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().offset(JFBoardSettings.boardLeftMargin)
            maker.right.equalToSuperview()
           maker.height.equalTo(JFBoardSettings.boardHeight)
            maker.bottom.equalToSuperview().offset(-JFBoardSettings.boardBottomMargin)
        };
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        let color = UIColor.black
        context.setStrokeColor(color.cgColor)
        let cellHeight = JFBoardSettings.cellHeight
        
        let font = JFBoardSettings.font
        // horizontal lines
        for hIndex in 1...JFBoardSettings.chesslayoutCount  {
           
            let hFlag = JFBoardSettings.yAxis[hIndex-1]
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.right
            let attributedDictonary = [NSFontAttributeName:font,NSForegroundColorAttributeName:UIColor.black, NSParagraphStyleAttributeName:paragraphStyle] as [String : Any]
            let attributeString = NSAttributedString(string: hFlag, attributes: attributedDictonary)
            attributeString.draw(in: CGRect(x: 0, y:self.height - cellHeight * CGFloat(hIndex+1)  , width: JFBoardSettings.boardLeftMargin, height: cellHeight))
        }
        
        // vertical lines
        
        for vIndex in 1...JFBoardSettings.chesslayoutCount  {
            let vFlag = JFBoardSettings.xAxis[vIndex-1]
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.center
            let attributedDictonary = [NSForegroundColorAttributeName:UIColor.black, NSParagraphStyleAttributeName:paragraphStyle,NSFontAttributeName:font] as [String : Any]
            let attributeString = NSAttributedString(string: vFlag, attributes: attributedDictonary)
            
            attributeString.draw(in: CGRect(x: cellHeight * CGFloat(vIndex), y:self.height - JFBoardSettings.boardBottomMargin  , width: cellHeight, height: JFBoardSettings.boardBottomMargin))
            
        }
        
        context.strokePath()
        
    }
    
}
