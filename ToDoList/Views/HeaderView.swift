//
//  HeaderView.swift
//  ToDoList
//
//  Created by Manmeet on 22/02/26.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subTitle: String
    let rotationAngle: Double
    let color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: rotationAngle))
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                    .bold()
                Text(subTitle)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
    }
}

#Preview {
    HeaderView(title: "TO DO List",
               subTitle: "Get things done",
               rotationAngle: 15,
               color: .pink)
}
