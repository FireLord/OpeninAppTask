//
//  SourceCardView.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 05/04/24.
//

import SwiftUI

struct SourceCardView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            Image("arrow")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
            
            Text("123")
                .font(.figtreeFont(.bold, fontSize: .mediumTitle))
            
            Text("Today's clicks")
                .font(.figtreeFont(.regular, fontSize: .smallTitle))
                .foregroundColor(Color(hex: 0x999CA0))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
        )
    }
}

#Preview {
    SourceCardView()
}
