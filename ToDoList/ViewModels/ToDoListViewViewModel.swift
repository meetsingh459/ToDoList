//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import Foundation
import Combine
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject {
    
    @Published var shouldShowNewItemView: Bool = false
    let userId: String
    
    init (userId: String) {
        self.userId = userId
    }
    
    func deleteItem(itemId: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(itemId)
            .delete()
    }
}
