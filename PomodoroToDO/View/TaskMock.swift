//
//  TaskMock.swift
//  PomodoroToDO
//
//  Created by Александр Тимофеев on 30.06.2021.
//

import Foundation

enum TaskMock {
  static let taskOne = Task(id: 0, taskName: "Task One", category: "Home", doneState: false, taskNote: "ggg")
  static let taskTwo = Task(id: 1, taskName: "Task two", category: "Work", doneState: false, taskNote: "ggg")
  static let taskThree = Task(id: 2, taskName: "Task three", category: "Study", doneState: false, taskNote: "hhh")
  static let workInProgress = [taskOne, taskTwo, taskThree]
  static let doneTaskOne = Task(id: 3, taskName: "Done task one", category: "work", doneState: true, taskNote: "lll")
  static let doneTaskTwo = Task(id: 4, taskName: "Done task three", category: "home", doneState: true, taskNote: "mmm")
  static let workIsDone = [doneTaskOne, doneTaskTwo]
}
