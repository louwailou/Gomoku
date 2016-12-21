//
//  ViewController.swift
//  Gomoku
//
//  Created by Sun on 2016/12/21.
//  Copyright © 2016年 Sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let (data, enc) = UTF8ToGB2312(str: "cbefbda8b7e5")
        let gbkStr = NSString(data: data as! Data, encoding: enc)!
        
        print("GBK string is: \(gbkStr)")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func UTF8ToGB2312(str: String) -> (NSData?, UInt) {
        let enc = CFStringConvertEncodingToNSStringEncoding(UInt32(CFStringEncodings.GB_18030_2000.rawValue))
        let datas = str.data(using: String.Encoding(rawValue: enc), allowLossyConversion: false)
        
        
        return (datas as NSData?, enc)
    }

}



