//
//  TaskDetail.swift
//  PomodoroToDO
//
//  Created by Александр Тимофеев on 29.06.2021.
//

import SwiftUI

struct TaskFormView: View {
    
    @EnvironmentObject var store: TaskStore
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var form: TaskForm
        
    
    
    var body: some View {
        
        NavigationView {
          Form {
            TextField("Title", text: $form.taskName)
            TextField("Category", text: $form.category)

            Section(header: Text("Notes📝")) {
              TextField("", text: $form.notes)
            }
          }
            
          .navigationBarTitle("Task Form", displayMode: .inline)
          .navigationBarItems(
            leading: Button("Cancel", action: dismiss),
            trailing: Button(form.updating ? "Update" : "Save",
            action: form.updating ? updateTask : saveTask))
            
        }
    }
}

extension TaskFormView {
  func dismiss() {
    presentationMode.wrappedValue.dismiss()
  }

  func saveTask() {
    
    store.create(
        taskName: form.taskName,
        category: form.category,
        taskNote: form.notes)

    dismiss()
  }

  func updateTask() {
    if let taskID = form.taskID {
        store.update(taskID: taskID, taskName: form.taskName, category: form.category,
            note: form.notes)

      dismiss()
    }
  }
}

#if DEBUG
struct TaskFormView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaskFormView(form: TaskForm())
            TaskFormView(form: TaskForm(TaskMock.workInProgress[0]))
        }
    }
}
#endif
