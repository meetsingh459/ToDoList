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
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(.pink)
                        .rotationEffect(Angle(degrees: 15))
                    
                    VStack {
                        Text("TO DO List")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                            .bold()
                        Text("Get things done")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    }
                    .padding(.top, 30)
                }
                .frame(width: UIScreen.main.bounds.width * 3, height: 300)
                .offset(x: 0, y: -100)
                
                Form {
                    TextField("Email address", text:$email)
                        .textFieldStyle(.roundedBorder)
                    SecureField("Password", text:$password)
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.blue)
                            Text("Log In")
                                .foregroundColor(.white)
                                .bold()
                        }
                        .frame(height: 40)
                    }
                }
                
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
