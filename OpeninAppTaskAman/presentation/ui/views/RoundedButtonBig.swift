//
//  RoundedButtonBig.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 05/04/24.
//

import SwiftUI

struct RoundedButtonBig: View {
    var title: String
    var icon: String
    var backgroundColor: Color
    var strokeColor: Color
    
    var body: some View {
        HStack {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            
            Text(title)
                .font(.figtreeFont(.bold, fontSize: .mediumTitle))
                .foregroundColor(.black)
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .foregroundColor(strokeColor)
                .background (
                    backgroundColor
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                )
        )
        
    }
}

#Preview {
    RoundedButtonBig(
        title: "Talk with us",
        icon: "whatsappIcon",
        backgroundColor: Color(hex: 0x4AD15F, alpha: 0.12),
        strokeColor: Color(hex: 0x4AD15F, alpha: 0.32))
    .padding()
}
