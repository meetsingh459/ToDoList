//
//  LoginView.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "TO DO List",
                           subTitle: "Get things done",
                           rotationAngle: 15,
                           color: .pink)
                .offset(x: 0, y: -100)
                
                Form {
                    TextField("Email address", text:$email)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text:$password)
                        .textFieldStyle(.roundedBorder)
                    
                    TLButton(title: "Log In", color: .blue) {
                        // Action
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
