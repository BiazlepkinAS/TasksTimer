//
//  Bpx.swift
//  TasksTimer
//
//  Created by Andrei Bezlepkin on 10.03.22.
//

import Foundation
import UIKit


class Box <T> {
    typealias Listener = (T) -> ()
    var value: T {
        didSet {
            listener?(value)
        }
    }
    var listener: Listener?
    
    init(_ value: T) {
        self.value = value
    }
    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    func removeBinding() {
        self.listener = nil
    }
}
