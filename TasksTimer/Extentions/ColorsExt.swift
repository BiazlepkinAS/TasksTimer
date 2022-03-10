//
//  ColorsExt.swift
//  TasksTimer
//
//  Created by Andrei Bezlepkin on 10.03.22.
//

import UIKit

extension UIColor {
    
    
    convenience init(hex: String) {
        
        var hexSenitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSenitized = hexSenitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        let leight = hexSenitized.count
        Scanner(string: hexSenitized).scanHexInt64(&rgb)
        
        if leight == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
        } else if leight == 8  {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
            
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
}
