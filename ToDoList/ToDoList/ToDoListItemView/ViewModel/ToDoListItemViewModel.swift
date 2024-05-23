//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by Saad Tahir on 15/05/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewModel : ObservableObject {
    @Published var item: ToDoListItem
    
    init(item: ToDoListItem) {
        self.item = item
    }
    
    func toggleIsDone() {
//        item.isDone.toggle()
        item.setState(!item.isDone)
        updateItem()
    }
    
    func updateItem() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        let userDB = Firestore.firestore().collection("user").document(userID)
        
        userDB.collection("todoList")
            .document(item.id)
            .updateData(item.asDictionery())
    }
}
