//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import SwiftUI

struct ToDoListItemView: View {
    
    @StateObject var viewModel: ToDoListItemViewViewModel = .init()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .bold()
                    .font(.system(size: 20))
                
                Text(
                    Date(timeIntervalSince1970: item.dueDate)
                        .formatted(date: .abbreviated, time: .shortened)
                )
                .font(.footnote)
                .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsCompleted(item: item)
            } label: {
                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle" )
                    .foregroundColor(.blue)
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(
        id: "123",
        title: "Get some milk",
        isCompleted: true,
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970)
    )
}

