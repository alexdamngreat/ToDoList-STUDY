//
//  TaskStore.swift
//  PomodoroToDO
//
//  Created by Александр Тимофеев on 30.06.2021.
//

import Foundation
import RealmSwift

final class TaskStore: ObservableObject {
    
    private var taskResults: Results<TaskDB>
    private var doneTaskResult: Results<TaskDB>
    
    init(realm: Realm) {
        taskResults = realm.objects(TaskDB.self)
            .filter("doneState = false")
        doneTaskResult = realm.objects(TaskDB.self)
            .filter("doneState = true")
    }
    
    var tasks: [Task] {
        taskResults.map(Task.init)
    }
    
    var doneTasks: [Task] {
        doneTaskResult.map(Task.init)
    }
    
}

extension TaskStore {
    
    func create(taskName: String, category: String, taskNote: String) {
        objectWillChange.send()
        
        do {
            
            let realm = try Realm()
            let taskDB = TaskDB()
            taskDB.id = UUID().hashValue
            taskDB.taskName = taskName
            taskDB.taskCategory = category
            taskDB.taskNote = taskNote
            try realm.write {
                realm.add(taskDB)
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func toggleDone(task: Task) {
        objectWillChange.send()
        
        do {
            
            let realm = try Realm()
            try realm.write {
                realm.create(TaskDB.self,
                             value: ["id": task.id, "doneState": !task.doneState], update: .modified)
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func update(taskID: Int, taskName: String, category: String, note: String) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            
            try realm.write {
                realm.create(
                    TaskDB.self,
                    value: ["id": taskID, "taskName": taskName, "taskCategory": category, "note": note], update: .modified)
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func delete(taskID: Int) {
        objectWillChange.send()
        
        guard let taskDB = doneTaskResult.first(where: { $0.id == taskID }) else
        { return }
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(taskDB)
            }
        }  catch let error {
            // Handle error
            print(error.localizedDescription)
        }
    }
}

