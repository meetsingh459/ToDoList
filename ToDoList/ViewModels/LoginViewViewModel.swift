//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import Foundation
import Combine
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String? = nil
    
    init() {}
    
    func userLogin()  {
        errorMessage = nil
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password )
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
        
        return true
    }
}
