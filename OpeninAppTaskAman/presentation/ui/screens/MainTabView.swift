//
//  MainTabView.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 05/04/24.
//

import SwiftUI

struct MainTabView: View {
    @State var index = 0
    
    var body: some View {
        ZStack {
            switch(index) {
            case 0:
                DashboardView()
            case 1:
                CoursesView()
            case 2:
                CampaignsView()
            case 3:
                ProfileView()
            default:
                DashboardView()
            }
            VStack {
                Spacer()
                HStack {
                    Button {
                        index = 0
                    } label: {
                        BottomNavIconView(title: "Links", icon: "linkIcon")
                    }
                    .opacity(index == 0 ? 1 : 0.1)
                    .background {
                        Rectangle()
                            .fill(.white)
                            .frame(width: 55, height: 55)
                    }
                    
                    Spacer()
                    
                    Button {
                        index = 1
                    } label: {
                        BottomNavIconView(title: "Courses", icon: "coursesIcon")
                    }
                    .opacity(index == 1 ? 1 : 0.1)
                    .background {
                        Rectangle()
                            .fill(.white)
                            .frame(width: 55, height: 55)
                    }
                    .offset(x: 15)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            Circle()
                                .fill(.white)
                                .frame(width: 75, height: 75)
                            
                            Circle()
                                .fill(Color(hex: 0x0E6FFF))
                                .frame(width: 60, height: 60)
                                .shadow(color: Color(hex: 0x0E6FFF, alpha: 0.6), radius: 5, y: 5)
                            
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                        }
                    }
                    .offset(y: -35)
                    
                    Spacer()
                    
                    Button {
                        index = 2
                    } label: {
                        BottomNavIconView(title: "Campaigns", icon: "campaignIcon")
                    }
                    .opacity(index == 2 ? 1 : 0.1)
                    .background {
                        Rectangle()
                            .fill(.white)
                            .frame(width: 55, height: 55)
                    }
                    .offset(x: -15)
                    
                    Spacer()
                    
                    Button {
                        index = 3
                    } label: {
                        BottomNavIconView(title: "Profile", icon: "profileIcon")
                    }
                    .opacity(index == 3 ? 1 : 0.1)
                    .background {
                        Rectangle()
                            .fill(.white)
                            .frame(width: 55, height: 55)
                    }
                }
                .padding(.horizontal, 35)
                .background(.white)
            }
        }
    }
}

#Preview {
    MainTabView()
        .background(Color.black.opacity(0.05))
}
