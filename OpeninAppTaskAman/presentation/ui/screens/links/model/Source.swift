//
//  Source.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 06/04/24.
//

import Foundation

struct Source: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let iconName: String
    let description: String
    
    static let sampleExample: [Source] = [
        Source(name: "123", iconName: "arrow", description: "Today's clicks"),
        Source(name: "Ahmedabad", iconName: "map", description: "Top Location"),
        Source(name: "Instagram", iconName: "globe", description: "Top Source")
    ]
}
