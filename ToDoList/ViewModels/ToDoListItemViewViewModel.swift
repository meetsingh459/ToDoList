//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewViewModel: ObservableObject {
    
    
    func toggleIsCompleted(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setCompleted(!item.isCompleted)
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        do {
            let data = try itemCopy.asDictionary()
            db.collection("users")
                .document(userId)
                .collection("todos")
                .document(itemCopy.id)
                .setData(data)
        } catch {
            print("Failed to encode model to dictionary: \(error)")
        }
    }
}
