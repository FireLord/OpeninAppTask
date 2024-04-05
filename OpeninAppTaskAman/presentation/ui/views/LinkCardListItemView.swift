//
//  LinkCardListItemView.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 05/04/24.
//

import SwiftUI

struct LinkCardListItemView: View {
    var body: some View {
        VStack {
            HStack {
                Image("amazonIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack(alignment: .leading) {
                    Text("Sample link name...")
                        .font(.figtreeFont(.regular, fontSize: .smallTitle))
                    
                    Text("22 Aug 2022")
                        .font(.figtreeFont(.regular, fontSize: .largeBody))
                        .foregroundColor(Color(hex: 0x999CA0))
                }
                
                Spacer()
                
                VStack {
                    Text("2323")
                        .font(.figtreeFont(.bold, fontSize: .smallTitle))
                    
                    Text("Clicks")
                        .font(.figtreeFont(.regular, fontSize: .largeBody))
                        .foregroundColor(Color(hex: 0x999CA0))
                }
            }
            .padding(10)
            
            // Link card
            HStack {
                Text("https://samplelink.oia.bio/ashd...")
                
                Spacer()
                
                Image("copyIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            .padding()
            .background(
                ZStack {
                    Color(hex: 0xE8F1FF)
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .foregroundColor(Color(hex: 0xA6C7FF))
                }
                    .cornerRadius(8, corners: [.bottomLeft, .bottomRight])
            )
            
        }
        .background(
            RoundedRectangle(cornerRadius: 9)
                .fill(.white)
        )
        .padding(.horizontal)
    }
}

#Preview {
    LinkCardListItemView().background(Color(hex: 0xF5F5F5))
}
