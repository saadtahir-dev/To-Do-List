//
//  Validations.swift
//  ToDoList
//
//  Created by Saad Tahir on 17/05/2024.
//

import Foundation

protocol ValidateCredentials {
    func validateLoginCredentials(email: String, password: String) -> (Bool, String)
    func validateRegistrationCredentials(name: String, email: String, password: String) -> (Bool, String)
}

extension ValidateCredentials {
    func validateLoginCredentials(email: String, password: String) -> (Bool, String) {
        var isValid: Bool = true
        var validationError = ""
        
        (isValid, validationError) = validateEmptyEmailAndPassword(email: email, password: password)
        if !isValid { return (isValid, validationError) }
        
        (isValid, validationError) = validateEmail(email: email)
        if !isValid { return (isValid, validationError) }
        
        return (true, "")
    }
    
    func validateRegistrationCredentials(name: String, email: String, password: String) -> (Bool, String) {
        var isValid: Bool = true
        var validationError = ""
        
        (isValid, validationError) = validateEmptyName(name: name)
        if !isValid { return (isValid, validationError) }
        
        (isValid, validationError) = validateEmptyEmailAndPassword(email: email, password: password)
        if !isValid { return (isValid, validationError) }
        
        (isValid, validationError) = validateEmail(email: email)
        if !isValid { return (isValid, validationError) }
        
        (isValid, validationError) = validatePassword(password: password)
        if !isValid { return (isValid, validationError) }
        
        return (true, "")
    }
    
    private func validateEmptyName(name: String) -> (Bool, String) {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            return (false, "* All fields are required.")
        }
        return (true, "")
    }
    
    private func validateEmptyEmailAndPassword(email: String, password: String) -> (Bool, String) {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return (false, "* All fields are required.")
        }
        return (true, "")
    }
    
    private func validateEmail(email: String) -> (Bool, String) {
        guard email.contains("@") && email.contains(".") else {
            return (false, "* Enter valid email.")
        }
        return (true, "")
    }
    
    private func validatePassword(password: String) -> (Bool, String) {
        guard password.count >= 6 else {
            return (false, "* Enter valid password with 6 or more characters.")
        }
        return (true, "")
    }
    
    
}
