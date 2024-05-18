//
//  Extensions.swift
//  ToDoList
//
//  Created by Saad Tahir on 18/05/2024.
//

import Foundation

extension Encodable {
    func asDictionery() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String : Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
