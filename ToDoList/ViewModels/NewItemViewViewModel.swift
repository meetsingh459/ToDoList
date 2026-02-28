//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import Foundation
import Combine

class NewItemViewViewModel : ObservableObject {
    
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        
        guard dueDate > Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
    
    init() {
        
    }
    
    func saveItem() {
        
    }
}
