//
//  ProfileView.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel: ProfileViewViewModel = .init()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    
                    HStack {
                        Text("Name: ")
                            .bold()
                        Text(user.username)
                    }
                    
                    HStack {
                        Text("Email: ")
                            .bold()
                        Text(user.email)
                    }

                    
                    HStack {
                        Text("Member Since: ")
                            .bold()
                        Text(
                            Date(timeIntervalSince1970: user.joinedOn)
                            .formatted(date: .abbreviated, time: .shortened)
                        )
                    }
                    
                    TLButton(title: "Log Out", color: .red) {
                        viewModel.logOut()
                    }
                    .padding()
                    
                    Spacer()
                } else {
                    Text("Loading user data...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
