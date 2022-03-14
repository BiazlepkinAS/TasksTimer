//
//  FoundationExt.swift
//  TasksTimer
//
//  Created by Andrei Bezlepkin on 10.03.22.
//

import UIKit

extension Int {
    
    func appendZero()-> String {
        if (self < 10) {
            return "0\(self)"
        } else {
            return "\(self)"
        }
    }
}

extension Double {
    func degreeToRadians() -> CGFloat {
        return CGFloat(self * .pi) / 180
    }
}
