//
//  ProfileView.swift
//  ToDoList
//
//  Created by Saad Tahir on 15/05/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            HStack (alignment: .bottom) {
                if let user = viewModel.user {
                    showUserInfo(user: user)
                } else {
                    Text("Loading User Info...")
                        .font(.title3)
                        .fontWeight(.medium)
                }
//                Spacer()
            }
            .navigationTitle("Profile")
            .offset(y: -45)

        }
    }
    
    @ViewBuilder
    func showUserInfo(user: User) -> some View {
        VStack {
            //image
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 200, height: 200)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.orange)
            
            //info: name, email, member since
            VStack (alignment: .leading) {
                HStack {
                    Text("Name: ")
                        .fontWeight(.medium)
                    Text("\(user.name)")
                }
                
                HStack {
                    Text("Email: ")
                        .fontWeight(.medium)
                    Text("\(user.email)")
                }
                
                HStack {
                    Text("Member Since: ")
                        .fontWeight(.medium)
                    Text("\(Date(timeIntervalSince1970: user.joiningDate).formatted(date: .abbreviated, time: .shortened))")
                }
            }
            
            //signout button
            TLButton(
                title: "Log Out",
                bgColor: .red
            ) {
                //action
                viewModel.logOut()
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView()
}
