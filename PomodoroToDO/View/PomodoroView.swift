//
//  PomodoroView.swift
//  PomodoroToDO
//
//  Created by Александр Тимофеев on 01.07.2021.
//

import SwiftUI

struct PomodoroView: View {
  
  @EnvironmentObject var store: TaskStore
  
  let workInProgressTasks: [Task]
  let task: Task
  
  var body: some View {
    Text(task.taskName)
  }
}

#if DEBUG
struct PomodoroView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TaskRowView(task: TaskMock.doneTaskOne)
      TaskRowView(task: TaskMock.taskOne)
    }
    .previewLayout(.sizeThatFits)
  }
}
#endif
