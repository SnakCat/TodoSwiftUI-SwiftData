//
//  ContentView.swift
//  ToDoLIst
//
//  Created by Дмитрий Трушин on 22/11/2024.
//

import SwiftUI
import SwiftData

struct TodoView: View {
    @Environment (\.modelContext) var modelContext
    @State private var path = [TodoModel]()
    @State private var sortOrder = SortDescriptor(\TodoModel.name)
    @State private var searchString = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            TodoListView(sort: sortOrder, searchString: searchString)
            .navigationTitle("TODO'S")
            .navigationDestination(for: TodoModel.self, destination: TodoDeteilView.init)
            .searchable(text: $searchString)
            .toolbar {
                Button("Add Todo", systemImage: "plus", action: addTodo)
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Name")
                            .tag(SortDescriptor(\TodoModel.name))
                        Text("Date")
                            .tag(SortDescriptor(\TodoModel.date))
                        Text("Priority")
                            .tag(SortDescriptor(\TodoModel.priority, order: .reverse))
                    }
                    .pickerStyle(.inline)
                }
            }
        }
    }
    
    func addTodo() {
        let todo = TodoModel()
        modelContext.insert(todo)
        path = [todo]
    }
}

#Preview {
    TodoView()
}
