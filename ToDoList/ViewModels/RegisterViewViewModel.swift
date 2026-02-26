//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var name: String = ""
    @Published var errorMessage: String? = nil
    
    init() {}
    
    func registerUser()  {
        errorMessage = nil
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
                return
            }
            
            guard let userId = result?.user.uid else {
                DispatchQueue.main.async {
                    self?.errorMessage = "Failed to retrieve user ID after registration."
                }
                return
            }
            
            self?.inserUserRecord(id: userId)
        }
        
    }
    
    private func inserUserRecord(id: String) {
        let user = User(id: id, username: name, email: email, joinedOn: Date().timeIntervalSince1970)

        do {
            let data = try user.asDictionary()
            let db = Firestore.firestore()
            db.collection("users")
                .document(id)
                .setData(data) { [weak self] error in
                    if let error = error {
                        DispatchQueue.main.async {
                            self?.errorMessage = error.localizedDescription
                        }
                    }
                }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter all the fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email."
            return false
        }
        
        guard password.count > 6 else {
            errorMessage = "Password should be more than 6 characters."
            return false
        }
        
        return true
    }

}
