//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel = .init()
    private var userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("List View")
            }
            .navigationTitle("ToDo List")
            .toolbar {
                Button {
                    viewModel.shouldShowNewItemView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.shouldShowNewItemView) {
                NewItemView(newItemPresented: $viewModel.shouldShowNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "123")
}
