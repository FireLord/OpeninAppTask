//
//  BottomNavIconView.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 06/04/24.
//

import SwiftUI

struct BottomNavIconView: View {
    var title: String
    var icon: String
    
    var body: some View {
        VStack {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                
            
            Text(title)
                .font(.figtreeFont(.bold, fontSize: .largeBody))
                .foregroundColor(.black)
        }
    }
}

#Preview {
    BottomNavIconView(title: "Profile", icon: "profileIcon")
}
