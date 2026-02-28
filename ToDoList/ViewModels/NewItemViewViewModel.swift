//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

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
        guard canSave, let userID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        let newId = UUID().uuidString
        let model = ToDoListItem(
            id: newId,
            title: title,
            isCompleted: false,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970
        )

        do {
            let data = try model.asDictionary()
            db.collection("users")
                .document(userID)
                .collection("todos")
                .document(newId)
                .setData(data) { [weak self] error in
                    if let error = error {
                        print("Failed to save item: \(error.localizedDescription)")
                        DispatchQueue.main.async {
                            self?.showAlert = true
                        }
                    }
                }
        } catch {
            print("Failed to encode model to dictionary: \(error)")
            DispatchQueue.main.async { [weak self] in
                self?.showAlert = true
            }
        }
    }
}

