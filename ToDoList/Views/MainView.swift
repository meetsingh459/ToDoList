//
//  MainView .swift
//  ToDoList
//
//  Created by Manmeet on 19/02/26.
//

import SwiftUI

struct MainView : View {
    
    @StateObject var viewModel: MainViewViewModel = .init()
    
    var body: some View {
        
        if viewModel.isLoggedIn, !viewModel.currentUserId.isEmpty {
            TabView {
                ToDoListView(userId: viewModel.currentUserId).tabItem {
                    Label("Home", systemImage:"house")
                }
                
                ProfileView().tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
            }
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView ()
}
