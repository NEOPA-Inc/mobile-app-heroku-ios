//
//  UIColorExtension.swift
//  neopa-shop
//
//  Created by 武藤優哉 on 2019/06/13.
//

import UIKit
import Foundation

extension UIColor {
    class func hexStr (_ hexStr : String, alpha : CGFloat) -> UIColor {
        var hexStr = hexStr
        hexStr = hexStr.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            //print("invalid hex string")
            return UIColor.white;
        }
    }
    class var accentColor: UIColor {
        get {
            return self.hexStr("27C1B4", alpha: 1.0)
        }
    }
    class var commonTextColor: UIColor {
        get {
            return self.hexStr("666666", alpha: 1.0)
        }
    }
    
}
