//
//  AddItemViewModel.swift
//  ToDoList
//
//  Created by Saad Tahir on 15/05/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AddItemViewModel : ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {
        
    }
    
    func saveToDoItem() {
        //check can save?
        guard canSave() else { return }
        
        //get current user id
        guard let userId = Auth.auth().currentUser?.uid else  { return }
        
        //create model
        let newItem = ToDoListItem(id: UUID().uuidString,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        //save model to db
        let userDB = Firestore.firestore().collection("user").document(userId)
        
        userDB.collection("todoList")
            .document(newItem.id)
            .setData(newItem.asDictionery())
        
    }
    
    func canSave() -> Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
