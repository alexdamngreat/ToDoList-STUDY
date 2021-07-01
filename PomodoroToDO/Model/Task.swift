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
    
    //var categoryImage: Category.image
    
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

//var testDatabase: [Task] = [
  //  Task(id: 1, taskName: "Task 1", category: "Home"),
    //Task(id: 2, taskName: "Task 2", category: "Work"),
   // Task(id: 3, taskName: "Task 3", category: "Study")
    //]
