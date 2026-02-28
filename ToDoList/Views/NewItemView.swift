//
//  NewItemView.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel: NewItemViewViewModel = .init()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(.plain)
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                
                TLButton(title: "Save", color: .pink) {
                    if viewModel.canSave {
                        viewModel.saveItem()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert.toggle()
                    }
                    
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all the details and select due date that is today or newer.")
                ) 
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
