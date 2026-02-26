//
//  RegisterView.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel: RegisterViewViewModel = .init()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register",
                       subTitle: "Start Organizing Todos",
                       rotationAngle: -15,
                       color: .orange)
            .offset(x: 0, y: -150)
            
            Form {
                if let error = viewModel.errorMessage, !error.isEmpty {
                    Text(error)
                        .foregroundColor(.red)
                }
                
                TextField("Name", text:$viewModel.name)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()
                
                TextField("Email address", text:$viewModel.email)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text:$viewModel.password)
                    .textFieldStyle(.roundedBorder)
                
                TLButton(title: "Create Account", color: .green) {
                    viewModel.registerUser()
                }
                .padding()
            }
            .offset(y: -30)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
