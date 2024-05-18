//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Saad Tahir on 15/05/2024.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject, ValidateCredentials {
    
    @Published var validationError: String?
    
    func login(email: String, password: String) {
        let (isValid, validationError) = validateLoginCredentials(email: email, password: password)
        guard isValid else {
            self.validationError = validationError
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
}
