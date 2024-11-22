//
//  TodoModel.swift
//  ToDoLIst
//
//  Created by Дмитрий Трушин on 22/11/2024.
//

import Foundation
import SwiftData

@Model
final class TodoModel {
    var name: String
    var deteil: String
    var date: Date
    var priority: Int
    
    init(name: String = "", deteil: String = "", date: Date = .now, priority: Int = 2) {
        self.name = name
        self.deteil = deteil
        self.date = date
        self.priority = priority
    }
}
