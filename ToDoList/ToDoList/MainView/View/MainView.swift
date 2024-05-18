//
//  MainView.swift
//  ToDoList
//
//  Created by Saad Tahir on 15/05/2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isUserSignedIn() && !viewModel.currentUserId.isEmpty {
            //signed In Screen
            TabView {
                ToDoListView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
