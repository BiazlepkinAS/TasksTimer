//
//  Task.swift
//  TasksTimer
//
//  Created by Andrei Bezlepkin on 14.03.22.
//

import Foundation

struct TaskType {
    let symbolName: String
    let typeName: String
    
}

struct Task {
    var taskName: String
    var taskDescription: String
    var seconds: Int
    var taskType: TaskType
    var imeStamp: Double
}

enum CountdownState {
    case suspended
    case running
    case paused
}
