//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Saad Tahir on 15/05/2024.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userID: String) {
        self._items = FirestoreQuery(collectionPath: "/user/\(userID)/todoList")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userID: userID))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button ("Delete") {
                                viewModel.deleteItem(item)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(.plain)
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button(action: {
                    viewModel.showNewItemView = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .sheet(isPresented: $viewModel.showNewItemView, content: {
                AddItemView(isPresented: $viewModel.showNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userID: "08Sq4XTnKOUbcpCKLCR3QMqO8JT2")
}
