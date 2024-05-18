//
//  MainViewModel.swift
//  ToDoList
//
//  Created by Saad Tahir on 15/05/2024.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
    
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener({ [weak self] _, user in
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                currentUserId = user?.uid ?? ""
            }
            
        })
    }
    
    func isUserSignedIn() -> Bool {
        Auth.auth().currentUser != nil
    }
}

