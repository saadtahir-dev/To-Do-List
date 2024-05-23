//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Saad Tahir on 15/05/2024.
//

import SwiftUI

struct ToDoListItemView: View {
    
    @ObservedObject var viewModel: ToDoListItemViewModel
    
    init(item: ToDoListItem) {
        self.viewModel = ToDoListItemViewModel(item: item)
    }
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text("\(viewModel.item.title)")
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: viewModel.item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button(
                action: {
                    //Mark Item Done
                    viewModel.toggleIsDone()
                },
                label: {
                    Image(systemName: viewModel.item.isDone ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(.blue)
                })
        }
    }
}

#Preview {
    ToDoListItemView(
        item: ToDoListItem(
            id: "123",
            title: "Hello World!!",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: true
        )
    )
}
