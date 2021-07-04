//
//  Pomodoro.swift
//  PomodoroToDO
//
//  Created by Александр Тимофеев on 29.06.2021.
//


struct Task: Identifiable {
    
    let id: Int
    let taskName: String
    let category: String
    let doneState: Bool
    let taskNote: String
    
}

extension Task {
    init(taskDatabase: TaskDB) {
        id = taskDatabase.id
        taskName = taskDatabase.taskName
        category = taskDatabase.taskCategory
        doneState = taskDatabase.doneState
        taskNote = taskDatabase.taskNote
    }
}
