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
            ToDoListView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView ()
}
