//
//  RegisterView.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            HeaderView(title: "Register",
                       subTitle: "Start Organizing Todos",
                       rotationAngle: -15,
                       color: .orange)
            .offset(x: 0, y: -150)
            
            Form {
                TextField("Name", text:$name)
                    .textFieldStyle(.roundedBorder) 
                    .autocorrectionDisabled()
                
                TextField("Email address", text:$email)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text:$password)
                    .textFieldStyle(.roundedBorder)
                
                TLButton(title: "Create Account", color: .green) {
                    // Action
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
