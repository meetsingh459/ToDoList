//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject {
    
    @Published var user: User? = nil
    
    init() { }
    
    func fetchUser() {
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(userID).getDocument { [weak self] (document, error) in
            if let data = document?.data() {
                DispatchQueue.main.async {
                    self?.user = User(
                        id: data["id"] as? String ?? "",
                        username: data["username"] as? String ?? "",
                        email: data["email"] as? String ?? "",
                        joinedOn: data["joinedOn"] as? TimeInterval ?? 0)
                }
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
