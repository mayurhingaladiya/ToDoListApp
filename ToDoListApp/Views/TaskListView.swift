//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Mayur Hingaladiya on 11/02/2023.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskListVM = TaskListViewModel()
    @State var showSigninForm = false
    
    let tasks = testDataTasks
    @State var presentAddNewItem = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    ForEach(taskListVM.taskCellViewModels) { taskCellVM in
                        TaskCell(taskCellVM: taskCellVM)
                    }
                    if presentAddNewItem {
                        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "", completed: false))) { task in
                            taskListVM.addTask(task: task)
                            presentAddNewItem.toggle()
                        }
                    }
                }
                Button {
                    presentAddNewItem.toggle()
                    
                } label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add New Task")
                    }
                }
            }
            .navigationTitle("Tasks")
            .navigationBarItems(trailing:
                                    Button {
                showSigninForm.toggle()
            } label: {
                Image(systemName: "person.circle")
            })
            .sheet(isPresented:$showSigninForm) {
                SigninView()
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
                
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

struct TaskCell: View {
    @ObservedObject var taskCellVM: TaskCellViewModel
    var onComit: (Task) -> (Void) = { _ in}
    
    var body: some View {
        HStack {
            Image(systemName: taskCellVM.task.completed ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                    taskCellVM.task.completed.toggle()
                }
            TextField("Enter the task title", text: $taskCellVM.task.title, onCommit: {
                onComit(taskCellVM.task)
            })
        }
    }
}
