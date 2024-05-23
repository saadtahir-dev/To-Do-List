//
//  AddItemView.swift
//  ToDoList
//
//  Created by Saad Tahir on 15/05/2024.
//

import SwiftUI

struct AddItemView: View {
    
    @StateObject var viewModel = AddItemViewModel()
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top)
            
            Form {
                //title
                TextField("Title", text: $viewModel.title)
                
                //dueDate
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                
                //button
                TLButton (title: "Save",
                          bgColor: .pink) {
                    if viewModel.canSave() {
                        viewModel.saveToDoItem()
                        isPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                          .padding(.horizontal)
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(
                    title: Text("Error"),
                    message: Text("All Fields are Required.\n Due date should be equal or greater than today.")
                )
            })
        }
    }
}

#Preview {
    AddItemView(isPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
