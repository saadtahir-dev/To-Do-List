//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by Saad Tahir on 15/05/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject, ValidateCredentials {
    
    @Published var validationError: String?
    
    func register(name: String, email: String, password: String) {
        let (isValid, validationError) = validateRegistrationCredentials(name: name, email: email, password: password)
        guard isValid else {
            self.validationError = validationError
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self else { return }
            guard let userId = result?.user.uid else { return }
            insertUserRecord(userId: userId, 
                             name: name,
                             email: email)
        }
    }
    
    private func insertUserRecord(userId: String, name: String, email: String) {
        let user = User(id: userId, 
                        name: name,
                        email: email,
                        joiningDate: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("user")
            .document(userId)
            .setData(user.asDictionery())
    }
    
    
}
