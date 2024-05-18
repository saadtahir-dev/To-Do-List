//
//  LoginOrRegistrationForm.swift
//  ToDoList
//
//  Created by Saad Tahir on 16/05/2024.
//

import SwiftUI

struct LoginOrRegistrationForm: View {
    
    let fieldOnePlaceHolder: String?
    @State var fieldOneText = ""
    
    let fieldTwoPlaceHolder: String?
    @State var fieldTwoText = ""
    
    let secureFieldPlaceholder: String?
    @State var password = ""
    
    let error: String
    
    let actionButtonText: String
    let actionButtonBgColor: Color
    let action: ((_ name: String, _ email: String, _ password: String) -> Void)?
    
    var body: some View {
        Form {
            if !error.trimmingCharacters(in: .whitespaces).isEmpty {
                Text(error)
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .foregroundStyle(.red)
            }
            
            if let fieldOnePlaceHolder {
                TextField(fieldOnePlaceHolder, text: $fieldOneText)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
            }
            
            if let fieldTwoPlaceHolder {
                TextField(fieldTwoPlaceHolder, text: $fieldTwoText)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
            }
            
            if let secureFieldPlaceholder {
                SecureField(secureFieldPlaceholder, text: $password)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
            }
            
            TLButton(title: actionButtonText,
                     bgColor: actionButtonBgColor) {
                action?(fieldOneText, fieldTwoText, password)
            }
            .padding()
        }
    }
}

#Preview {
    LoginOrRegistrationForm(fieldOnePlaceHolder: "Name",
                            fieldTwoPlaceHolder: "Email",
                            secureFieldPlaceholder: "Password",
                            error: "error error error", 
                            actionButtonText: "Login",
                            actionButtonBgColor: .yellow,
                            action: nil)
}
