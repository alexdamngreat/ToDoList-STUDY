//
//  TaskList.swift
//  PomodoroToDO
//
//  Created by Александр Тимофеев on 29.06.2021.
//

import SwiftUI

struct TaskListView: View {
  
  @EnvironmentObject var store: TaskStore
  @State private var taskFormIsPresented = false
  
  let workInProgressTasks: [Task]
  let doneTasks: [Task]
  
  var body: some View {
    List {
      Section(header: Text("Task in progress")) {
        if workInProgressTasks.isEmpty {
          Text("Add new task to the list")
            .foregroundColor(.gray)
        }
        ForEach(workInProgressTasks) { task in
          TaskRowView(task: task)
        }
        newTaskButton
      }
      Section(header: Text("Done Tasks")) {
        if doneTasks.isEmpty {
          Text("No done tasks today")
        }
        ForEach(doneTasks) { task in
          TaskRowView(task: task)
        }
      }
    }
    .listStyle(GroupedListStyle())
    .navigationBarTitle("Your tasks for today")
  }
  
  var newTaskButton: some View {
    Button(action: addNewTask) {
      HStack {
        Image(systemName: "plus.circle.fill")
        Text("Add new task")
          .bold()
      }
    }
    .foregroundColor(.green)
    .sheet(isPresented: $taskFormIsPresented) {
      TaskFormView(form: TaskForm())
        .environmentObject(self.store)
    }
  }
}

extension TaskListView {
  func addNewTask() {
    taskFormIsPresented.toggle()
  }
}

#if DEBUG
struct TaskList_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TaskListView(workInProgressTasks: TaskMock.workInProgress, doneTasks: TaskMock.workIsDone)
      TaskListView(workInProgressTasks: [], doneTasks: [])
    }
  }
}
#endif

