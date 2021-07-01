//
//  ContentView.swift
//  PomodoroToDO
//
//  Created by Александр Тимофеев on 29.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: TaskStore
    
    var body: some View {
        NavigationView {
            TaskListView(workInProgressTasks: store.tasks, doneTasks: store.doneTasks)
            
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaskListView(workInProgressTasks: TaskMock.workInProgress, doneTasks: TaskMock.workIsDone)
            TaskListView(workInProgressTasks: [], doneTasks: [])
        }
    }
}
#endif

