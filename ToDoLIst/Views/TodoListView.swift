//
//  TodoListView.swift
//  ToDoLIst
//
//  Created by Дмитрий Трушин on 22/11/2024.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    @Query var todoModel: [TodoModel]
    @Environment (\.modelContext) var modelContext
    
    var body: some View {
        List {
            ForEach(todoModel) { todo in
                NavigationLink(value: todo) {
                    VStack(alignment: .leading) {
                        Text(todo.name)
                            .font(.headline)
                        Text(todo.deteil)
                        Text(todo.date.formatted(date: .long, time: .shortened))
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .onDelete(perform: deleteTodo)
        }
    }
        
    func deleteTodo(_ indexSet: IndexSet) {
        for index in indexSet {
            let todo = todoModel[index]
            modelContext.delete(todo)
        }
    }
    
    init(sort: SortDescriptor<TodoModel>, searchString: String) {
        _todoModel = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
}

#Preview {
    TodoListView(sort: SortDescriptor(\TodoModel.name), searchString: "")
}
