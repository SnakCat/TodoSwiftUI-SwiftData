//
//  TodoDeteilView.swift
//  ToDoLIst
//
//  Created by Дмитрий Трушин on 22/11/2024.
//

import SwiftUI
import SwiftData

struct TodoDeteilView: View {
    @Bindable var todoModel: TodoModel
    
    var body: some View {
        Form {
            TextField("Name", text: $todoModel.name)
            TextField("Deteil", text: $todoModel.deteil, axis: .vertical)
            DatePicker("Date", selection: $todoModel.date)
            
            Section("Priority") {
                Picker("Priority", selection: $todoModel.priority) {
                    Text("Easy").tag(1)
                    Text("Normal").tag(2)
                    Text("Hard").tag(3)
                }
                .pickerStyle(.segmented)
            }
        }
    }
}

#Preview {
    do {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let conteiner = try ModelContainer(for: TodoModel.self, configurations: configuration)
        let example = TodoModel(name: "Task1", deteil: "Test task description Test task description Test task description")
        return TodoDeteilView(todoModel: example)
            .modelContainer(conteiner)
    } catch {
        fatalError()
    }
    
}
