//
//  TLButton.swift
//  ToDoList
//
//  Created by Saad Tahir on 17/05/2024.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let bgColor: Color
    let action: (() -> Void)?
    
    var body: some View {
        Button(action: {
            action?()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(bgColor)
                
                Text(title)
                    .bold()
                    .foregroundStyle(.white)
            }
        })
        .frame(height: 40)
    }
}

#Preview {
    TLButton(title: "Title",
             bgColor: .pink,
             action: {
        print("Button CLicked")
    })
}
