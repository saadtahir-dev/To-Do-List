//
//  RegisterView.swift
//  ToDoList
//
//  Created by Saad Tahir on 15/05/2024.
//

import SwiftUI

struct RegisterView: View {
    
    @ObservedObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            //MARK: - Header View
            LoginOrRegisterHeaderView(title: "Register", 
                                      subtitle: "Start Organizing Todo's",
                                      rotationAngle: -15,
                                      bgColor: .orange)
            .offset(y: -150)
            
            //MARK: - Register View
            LoginOrRegistrationForm(fieldOnePlaceHolder: "Name",
                                    fieldTwoPlaceHolder: "Email",
                                    secureFieldPlaceholder: "Password",
                                    error: viewModel.validationError ?? "",
                                    actionButtonText: "Register",
                                    actionButtonBgColor: .green) { name,email,password in
                print("Register New User with: \nName: \(name)\nEmail: \(email)\nPassword: \(password)")
                viewModel.register(name: name, email: email, password: password)
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
