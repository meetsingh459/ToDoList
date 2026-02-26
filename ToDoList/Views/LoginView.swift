//
//  LoginView.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewViewModel = .init()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "TO DO List",
                           subTitle: "Get things done",
                           rotationAngle: 15,
                           color: .pink)
                .offset(x: 0, y: -100)
                
                Form {
                    if let error = viewModel.errorMessage, !error.isEmpty {
                        Text(error)
                            .foregroundColor(.red)
                    }
                        
                    TextField("Email address", text:$viewModel.email)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text:$viewModel.password)
                        .textFieldStyle(.roundedBorder)
                    
                    TLButton(title: "Log In", color: .blue) {
                        viewModel.userLogin()
                    }
                    .padding()
                }
                .offset(y: -30)
                
                VStack {
                    Text("New around here")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    LoginView()
}
