//
//  ContentView.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 05/04/24.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack {
            VStack {
                // Dashboard title and setting icon
                HStack {
                    Text("Dashboard")
                        .font(.figtreeFont(.bold, fontSize: .mediumHeading))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white.opacity(0.12))
                                .frame(width: 40, height: 40)
                            
                            Image("wrench")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                    }
                    .foregroundColor(.white)
                    
                }
                .padding(.top, 50)
                .padding()
                
                ZStack {
                    // ScrollView Background with custom corners
                    Rectangle()
                        .fill(Color(hex: 0xF5F5F5))
                        .cornerRadius(16, corners: [.topLeft, .topRight])
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        // Greeting based on time
                        Text("Good morning")
                            .font(.figtreeFont(.regular, fontSize: .mediumTitle))
                            .foregroundColor(Color(hex: 0x999CA0))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .padding(.top)
                        
                        // User name with hello
                        HStack {
                            Text("Ajay Manva")
                                .font(.figtreeFont(.bold, fontSize: .mediumHeading))
                                
                            Image("handEmoji") // builtIn emoji is opposite so used image 👋
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        // Line chart
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.white)
                            .frame(width: 360, height: 200)
                            .padding()
                        
                        // Source cards
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                SourceCardView()
                                SourceCardView()
                                SourceCardView()
                            }
                        }
                        .padding(.horizontal)
                        
                        // Analytics button
                        Button {
                            print("HI! openinAppUser")
                        } label: {
                            OutlineButtonBig(
                                title: "View Analytics",
                                icon: "analyticsArrow"
                            )
                        }
                        .padding()

                        // Button selector header view
                        ButtonFilterHeaderView()
                            .padding(.horizontal)
                        
                        // Links list limit 5 items (according to figma)
                        LazyVStack {
                            ForEach(1...5, id: \.self) { _ in
                                LinkCardListItemView()
                                    .padding(.bottom)
                            }
                        }
                        
                        // View All Links
                        
                    }
                }
            }
            
        }
        .background(.blue)
        .ignoresSafeArea()
    }
}

#Preview {
    DashboardView()
}

struct ButtonFilterHeaderView: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                RoundedButtonSmall(
                    title: "Top Links",
                    color: Color(hex: 0x0E6FFF),
                    fontColor: .white
                )
            }
            
            Button {
                
            } label: {
                RoundedButtonSmall(
                    title: "Recent Links",
                    color: .clear,
                    fontColor: Color(hex: 0x999CA0)
                )
            }
            
            Spacer()
            
            Button {
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color(hex: 0xEBEBEB))
                        .frame(width: 40, height: 40)
                    
                    Image("search")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
            }
            .foregroundColor(.white)
        }
    }
}
