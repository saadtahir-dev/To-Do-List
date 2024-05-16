//
//  LoginOrRegisterHeaderView.swift
//  ToDoList
//
//  Created by Saad Tahir on 16/05/2024.
//

import SwiftUI

struct LoginOrRegisterHeaderView: View {
    var body: some View {
        HStack(alignment: .top) {
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundStyle(.pink)
                    .rotationEffect(Angle(degrees: 15))
                
                VStack {
                    Text("To Do List")
                        .font(.system(size: 50))
                        .bold()
                        .foregroundStyle(.white)
                    
                    Text("Get Things Done")
                        .font(.system(size: 30))
                        .foregroundStyle(.white)
                    
                }.padding(.top, 30)
            }
            .frame(width: UIScreen.main.bounds.width*3,
                   height: 300)
            
        }
    }
}

#Preview {
    LoginOrRegisterHeaderView()
}
