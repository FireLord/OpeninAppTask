//
//  RoundedButtonSmall.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 05/04/24.
//

import SwiftUI

struct RoundedButtonSmall: View {
    var title: String
    var color: Color
    var fontColor: Color
    
    var body: some View {
        Text(title)
            .font(.figtreeFont(.bold, fontSize: .mediumTitle))
            .foregroundColor(fontColor)
            .frame(width: 100, height: 33)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(color)
                
            )
    }
}

#Preview {
    RoundedButtonSmall(title: "Top Links", color: Color(hex: 0x0E6FFF), fontColor: .white)
}
