//
//  ToDoListItemModel.swift
//  ToDoList
//
//  Created by Saad Tahir on 15/05/2024.
//

import Foundation

struct ToDoListItem : Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setState(_ isDone: Bool) {
        self.isDone = isDone
    }
}
