//
//  LoginView.swift
//  ToDoList
//
//  Created by Saad Tahir on 15/05/2024.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //MARK: - Header View
                LoginOrRegisterHeaderView(title: "To Do List",
                                          subtitle: "Get it Done",
                                          rotationAngle: 15,
                                          bgColor: .pink)
                .offset(y: -150)
                
                
                //MARK:  -Login Form
                LoginOrRegistrationForm(fieldOnePlaceHolder: nil,
                                        fieldTwoPlaceHolder: "Email",
                                        secureFieldPlaceholder: "Password",
                                        error: viewModel.validationError ?? "",
                                        actionButtonText: "Login",
                                        actionButtonBgColor: .blue) { _,email,password in
                    print("Login with: \n Email: \(email)\nPassword: \(password)")
                    viewModel.login(email: email, password: password)
                }
                .offset(y: -50)
                
                //MARK: - RegisterView
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an Account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
