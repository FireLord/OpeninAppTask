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
                            OutlineButtonBig()
                        }
                        .padding()

                        // Button selector header view
                        HStack {
                            Button {
                                
                            } label: {
                                Text("Top Links")
                                    .font(.figtreeFont(.regular, fontSize: .mediumTitle))
                                    .foregroundColor(.white)
                                    .frame(width: 100, height: 33)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(Color(hex: 0x0E6FFF))
                                        
                                    )
                            }
                        }
                        
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
