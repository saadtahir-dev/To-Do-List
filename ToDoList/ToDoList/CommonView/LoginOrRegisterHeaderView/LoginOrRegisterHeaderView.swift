//
//  LoginOrRegisterHeaderView.swift
//  ToDoList
//
//  Created by Saad Tahir on 16/05/2024.
//

import SwiftUI

struct LoginOrRegisterHeaderView: View {
    
    let title: String
    let subtitle: String
    let rotationAngle: Double
    let bgColor: Color
    
    var body: some View {
        HStack(alignment: .top) {
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundStyle(bgColor)
                    .rotationEffect(Angle(degrees: rotationAngle))
                
                VStack {
                    Text(title) //"To Do List")
                        .font(.system(size: 50))
                        .bold()
                        .foregroundStyle(.white)
                    
                    Text(subtitle) //"Get Things Done")
                        .font(.system(size: 30))
                        .foregroundStyle(.white)
                    
                }.padding(.top, 80)
            }
            .frame(width: UIScreen.main.bounds.width*3,
                   height: 350)
            
        }
    }
}

#Preview {
    LoginOrRegisterHeaderView(title: "Title",
                              subtitle: "Subtitle",
                              rotationAngle: 15,
                              bgColor: .pink)
}
