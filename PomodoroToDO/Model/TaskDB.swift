//
//  TaskDataBase.swift
//  PomodoroToDO
//
//  Created by Александр Тимофеев on 30.06.2021.
//

import Foundation
import RealmSwift

class TaskDB: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var taskName = ""
    @objc dynamic var taskCategory = ""
    @objc dynamic var taskNote = ""
    @objc dynamic var doneState = false
    
    override static func primaryKey() -> String? {
        "id"
    }
    
    
    
}
