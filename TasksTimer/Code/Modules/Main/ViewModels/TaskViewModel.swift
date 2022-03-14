//
//  TaskViewModel.swift
//  TasksTimer
//
//  Created by Andrei Bezlepkin on 14.03.22.
//

import Foundation

class TaskViewModel {
    private var task: Task!
    private let taskType: [TaskType] = [
    TaskType(symbolName: "start", typeName: "Priority"),
    TaskType(symbolName: "iphone", typeName: "Develop"),
    TaskType(symbolName: "gamesCont", typeName: "Gaming"),
    TaskType(symbolName: "wand.and.stars.inverse", typeName: "Editing")
    ]
    private var selectedIndex = -1 {
        didSet {
            self.task.taskType = self.getTaskType()[selectedIndex]
        }
    }
    private var hours = Box(0)
    private var minutes = Box(0)
    private var seconds = Box(0)
    
    
    init() {
        task = Task(taskName: "", taskDescription: "", seconds: 0, taskType: .init(symbolName: "", typeName: ""), imeStamp: 0)
    }
    
    func setSelectedIndex(to value: Int) {
        self.selectedIndex = value
    }
    
    func setTaskName(to value: String) {
        self.task.taskName = value
    }
    
    func setTaskDescription(to value: String) {
        self.task.taskDescription = value
    }
    
    func getSelectedIndex() -> Int {
        self.selectedIndex
    }
    
    func getTask() -> Task {
        return self.task
    }
    
    func getTaskType() -> [TaskType] {
        return self.taskType
    }
    
    
}
