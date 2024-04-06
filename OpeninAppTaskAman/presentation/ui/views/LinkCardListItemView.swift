//
//  LinkCardListItemView.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 05/04/24.
//

import SwiftUI

struct LinkCardListItemView: View {
    @State private var isLinkCopied = false
    var linkData: LinkData
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: linkData.original_image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView() // Placeholder while loading
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48, height: 48)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    case .failure(_):
                        Image("amazonIcon") // Placeholder for failure/error
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48, height: 48)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(linkData.title)
                        .font(.figtreeFont(.regular, fontSize: .smallTitle))
                        .lineLimit(1)
                    
                    Text("\(convertDateString(linkData.created_at) ?? "22 Aug 2022")")
                        .font(.figtreeFont(.regular, fontSize: .largeBody))
                        .foregroundColor(Color(hex: 0x999CA0))
                }
                
                Spacer()
                
                VStack {
                    Text("\(linkData.total_clicks)")
                        .font(.figtreeFont(.bold, fontSize: .smallTitle))
                    
                    Text("Clicks")
                        .font(.figtreeFont(.regular, fontSize: .largeBody))
                        .foregroundColor(Color(hex: 0x999CA0))
                }
            }
            .padding(10)
            
            // Link card
            HStack {
                Text(linkData.web_link)
                    .font(.figtreeFont(.regular, fontSize: .smallTitle))
                    .foregroundColor(Color(hex: 0x0E6FFF))
                    .lineLimit(1)
                    .onTapGesture {
                        guard let url = URL(string: linkData.web_link) else { return }
                        UIApplication.shared.open(url)
                    }
                
                Spacer()
                
                Button {
                    UIPasteboard.general.string = linkData.web_link
                    isLinkCopied.toggle()
                } label: {
                    Image("copyIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
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
        .alert(isPresented: $isLinkCopied) {
            Alert(title: Text("Link Copied!"), message: nil, dismissButton: .default(Text("OK")))
        }
        .background(
            RoundedRectangle(cornerRadius: 9)
                .fill(.white)
        )
        .padding(.horizontal)
    }
}

#Preview {
    LinkCardListItemView(linkData: LinkData.sampleExample).background(Color(hex: 0xF5F5F5))
}

func convertDateString(_ dateString: String) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    
    guard let date = dateFormatter.date(from: dateString) else {
        return nil // Return nil if unable to parse the date
    }
    
    dateFormatter.dateFormat = "dd MMM yyyy"
    let formattedDate = dateFormatter.string(from: date)
    
    return formattedDate
}
