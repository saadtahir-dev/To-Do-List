//
//  ProfileViewModel.swift
//  ToDoList
//
//  Created by Saad Tahir on 15/05/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel : ObservableObject {
    @Published var user: User? = nil
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("user").document(userID).getDocument { [weak self] snapShot, error in
            guard let data = snapShot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                user = User(id: data["id"] as? String ?? "",
                            name: data["name"] as? String ?? "",
                            email: data["email"] as? String ?? "",
                            joiningDate: data["joiningDate"] as? TimeInterval ?? 0)
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            
        }
    }
}
