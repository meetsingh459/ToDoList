//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    var id: String
    var title: String
    var isCompleted: Bool
    var dueDate: TimeInterval
    var createdDate: TimeInterval
    
    mutating func setCompleted(_ state: Bool) {
        isCompleted = state
    }
}
