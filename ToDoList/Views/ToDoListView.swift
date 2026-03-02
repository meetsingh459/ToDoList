//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.deleteItem(itemId: item.id)
                            
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(.plain)
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
    ToDoListView(userId: "V7JGrfjYbbOcXFmVVFmIYDe5WW62")
}
