//
//  TaskForm.swift
//  PomodoroToDO
//
//  Created by Александр Тимофеев on 30.06.2021.
//

import Foundation

class TaskForm: ObservableObject {
  
  @Published var taskName = ""
  @Published var category = ""
  @Published var notes = ""
  
  var taskID: Int?
  var updating: Bool {
    taskID != nil
  }
  
  init() { }
  
  init(_ task: Task) {
    taskName = task.taskName
    category = task.category
    notes = task.taskNote
    taskID = task.id
  }
}
