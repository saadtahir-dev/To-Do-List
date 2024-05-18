//
//  UserModel.swift
//  ToDoList
//
//  Created by Saad Tahir on 18/05/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joiningDate: TimeInterval
}
