//
//  Constants.swift
//  TasksTimer
//
//  Created by Andrei Bezlepkin on 10.03.22.
//

import UIKit

class Constants {
    
    static var hasTopNotch: Bool {
        guard #available(iOS 11, *), let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else {return false }
        return window.safeAreaInsets.top >= 44
    }

    
}
