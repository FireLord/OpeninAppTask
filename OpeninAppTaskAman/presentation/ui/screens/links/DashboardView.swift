//
//  ContentView.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 05/04/24.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
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
                        let hour = Calendar.current.component(.hour, from: Date())
                        var greeting: String {
                            switch hour {
                            case 6..<12:
                                return "Good morning"
                            case 12..<17:
                                return "Good afternoon"
                            case 17..<22:
                                return "Good evening"
                            default:
                                return "Good night"
                            }
                        }
                        Text(greeting)
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
                        LineChartView()
                            .padding()
                        
                        // Source cards
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(appViewModel.sourceDataList) { source in
                                    SourceCardView(source: source)
                                        .padding(.trailing)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .task {
                            Task {
                                await appViewModel.getSourceData()
                            }
                        }
                        
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
                        if appViewModel.isLoading {
                            ProgressView()
                        }
                        LazyVStack {
                            ForEach(appViewModel.linkDataList) { linkData in
                                LinkCardListItemView(linkData: linkData)
                                    .padding(.bottom)
                            }
                        }
                        .task {
                            Task {
                                await appViewModel.getTopLinkList()
                            }
                        }
                        .onChange(of: appViewModel.isTopLinkSelected) { newValue in
                            if newValue {
                                Task {
                                    await appViewModel.getTopLinkList()
                                }
                            } else {
                                Task {
                                    await appViewModel.getRecentLinkList()
                                }
                            }
                        }
                        .alert(item: $appViewModel.alertItem) { alertItem in
                            Alert(title: alertItem.title,
                                  message: alertItem.message,
                                  dismissButton: alertItem.dismissButton)
                        }
                        
                        // View All Links
                        Button {
                            
                        } label: {
                            OutlineButtonBig(title: "View all Links", icon: "linkIcon")
                        }
                        
                        // Whatsapp Button
                        Button {
                            print("Hi! reach out to me on whatspp")
                        } label: {
                            RoundedButtonBig(
                                title: "Talk with us",
                                icon: "whatsappIcon",
                                backgroundColor: Color(hex: 0x4AD15F, alpha: 0.12),
                                strokeColor: Color(hex: 0x4AD15F, alpha: 0.32))
                        }
                        .padding(.top)
                        .padding()
                        
                        // FAQ Button
                        Button {
                            
                        } label: {
                            RoundedButtonBig(
                                title: "Frequently Asked Questions",
                                icon: "faqIcon",
                                backgroundColor: Color(hex: 0xE8F1FF),
                                strokeColor: Color(hex: 0x0E6FFF, alpha: 0.32)
                            )
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 150)
                        
                    }
                    .refreshable {
                        Task {
                            appViewModel.isTopLinkSelected ? await appViewModel.getTopLinkList() : await appViewModel.getRecentLinkList()
                            
                            await appViewModel.getSourceData()
                        }
                    }
                }
            }
            
        }
        .background(Color(hex: 0x0E6FFF))
        .ignoresSafeArea()
    }
}

#Preview {
    DashboardView().environmentObject(AppViewModel())
}

struct ButtonFilterHeaderView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        HStack {
            Button {
                appViewModel.isTopLinkSelected = true
            } label: {
                RoundedButtonSmall(
                    title: "Top Links",
                    color: appViewModel.isTopLinkSelected ? Color(hex: 0x0E6FFF) : .clear,
                    fontColor: appViewModel.isTopLinkSelected ? .white : Color(hex: 0x999CA0)
                )
            }
            
            Button {
                appViewModel.isTopLinkSelected = false
            } label: {
                RoundedButtonSmall(
                    title: "Recent Links",
                    color: appViewModel.isTopLinkSelected ? .clear : Color(hex: 0x0E6FFF),
                    fontColor: appViewModel.isTopLinkSelected ? Color(hex: 0x999CA0) : .white
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

struct LineChartView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Overview")
                    .font(.figtreeFont(.regular, fontSize: .smallTitle))
                    .foregroundColor(Color(hex: 0x999CA0))
                
                Spacer()
                
                Button {
                    
                } label: {
                    HStack {
                        Text("22 Aug - 23 Sept")
                            .font(.figtreeFont(.regular, fontSize: .largeBody))
                            .foregroundColor(.black)
                        
                        Image("clock")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                    }
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundColor(Color(hex: 0xEBEBEB))
                    )
                }
            }
            .padding(.horizontal)
            
            ChartView()
                .frame(height: 200)
                .clipShape(Rectangle())
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
        )
    }
}
