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
                Text("Profile View")
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
