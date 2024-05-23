//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Saad Tahir on 15/05/2024.
//

import Foundation
import FirebaseFirestore

class ToDoListViewModel : ObservableObject {
    
    @Published var showNewItemView = false
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    
    
    func deleteItem(_ item: ToDoListItem) {
        let userDB = Firestore.firestore().collection("user").document(userID)
        
        userDB.collection("todoList")
            .document(item.id)
            .delete()
    }
}
