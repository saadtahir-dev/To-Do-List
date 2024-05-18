//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Saad Tahir on 15/05/2024.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button(action: {
                    //action
                }, label: {
                    Image(systemName: "plus")
                })
            }
        }
    }
}

#Preview {
    ToDoListView()
}
