//
//  OutlineButtonBig.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 05/04/24.
//

import SwiftUI

struct OutlineButtonBig: View {
    var body: some View {
        HStack {
            Image("analyticsArrow")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            
            Text("View Analytics")
                .font(.figtreeFont(.regular, fontSize: .mediumTitle))
                .foregroundColor(.black)
        }
        .frame(width: 358, height: 50)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundColor(Color(hex: 0xD8D8D8))
            }
        )
    }
}

#Preview {
    OutlineButtonBig()
}
