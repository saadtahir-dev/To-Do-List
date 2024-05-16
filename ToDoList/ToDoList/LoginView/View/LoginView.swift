//
//  LoginView.swift
//  ToDoList
//
//  Created by Saad Tahir on 15/05/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                //MARK: - Header View
                LoginOrRegisterHeaderView()
                    .offset(y: -120)
                
                
                //MARK:  -Login Form
                Form {
                    TextField("Email", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    SecureField("Password", text: $password)
                    
                    Button(action: {
                        //Login Action
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.blue)
                            
                            Text("Login")
                                .bold()
                                .foregroundStyle(.white)
                        }
                    })
                    .frame(height: 40)
                }
                
                
                //MARK: - RegisterView
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an Account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}
