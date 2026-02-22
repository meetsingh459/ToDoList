//
//  TLButton.swift
//  ToDoList
//
//  Created by Manmeet on 22/02/26.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.blue)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
            .frame(height: 40)
        }
    }
}

#Preview {
    TLButton(title: "Log In", color: .blue) {
        // Action
    }
}
