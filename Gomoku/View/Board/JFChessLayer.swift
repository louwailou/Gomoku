//
//  JFChessLayer.swift
//  Gomoku
//
//  Created by Sun on 2016/12/28.
//  Copyright © 2016年 Sun. All rights reserved.
//

import Foundation

class JFChess: CAShapeLayer {
   
    
}

func chessLayer(size:CGSize,white:Bool)-> CAShapeLayer{
    let chess = CAShapeLayer()
    chess.contents = UIImage(named: "")?.cgImage
    
    return chess
}
