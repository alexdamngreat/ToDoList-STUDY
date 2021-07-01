//
//  TaskRow.swift
//  PomodoroToDO
//
//  Created by Александр Тимофеев on 29.06.2021.
//

import SwiftUI

struct TaskRowView: View {
    
    @EnvironmentObject var store: TaskStore
    @State private var taskFormIsPresented = false
    
    let task: Task
    
    var body: some View {
        HStack {
            Button(action: openUpdateTask) {
               
                VStack(alignment: .leading) {
                    Text(task.taskName)
                        .font(.title)
                    Text(task.category)
                        .font(.subheadline)
                }
            }
            .buttonStyle(PlainButtonStyle())
            .sheet(isPresented: $taskFormIsPresented) {
                TaskFormView(form: TaskForm(self.task))
                    .environmentObject(self.store)
            }
            
            Spacer()
            Circle()
                .fill()
              .frame(width: 12, height: 12)

            
            Button(action: doneOrDeleteTask) {
                Image(systemName: task.doneState ? "trash.circle.fill" : "circle")
                  .resizable()
                  .frame(width: 35, height: 35)
                    .foregroundColor(task.doneState ? .red : .gray)
                  
            }
        }
    }
}

extension TaskRowView {
    func openUpdateTask() {
        if !task.doneState {
            taskFormIsPresented.toggle()
        }
    }
    
    func doneOrDeleteTask() {
        withAnimation {
            if task.doneState {
                store.delete(taskID: task.id)
            } else {
                store.toggleDone(task: task)
            }
        }
    }
}

#if DEBUG
struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaskRowView(task: TaskMock.doneTaskOne)
            TaskRowView(task: TaskMock.taskOne)
        }
        .previewLayout(.sizeThatFits)
    }
}
#endif
