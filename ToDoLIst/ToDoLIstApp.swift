//
//  ToDoLIstApp.swift
//  ToDoLIst
//
//  Created by Дмитрий Трушин on 22/11/2024.
//

import SwiftUI
import SwiftData

@main
struct ToDoLIstApp: App {
    var body: some Scene {
        WindowGroup {
            TodoView()
        }
        .modelContainer(for: TodoModel.self)
    }
}
