//
//  PetData.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 05/04/24.
//

import Foundation

struct PlotData: Identifiable, Equatable {
    var id: Int { month }
    let month: Int
    let value: Double
    
    static var sampleExample: [PlotData] {
        [PlotData(month: 0, value: 22),
         PlotData(month: 1, value: 25),
         PlotData(month: 2, value: 33),
         PlotData(month: 3, value: 78),
         PlotData(month: 4, value: 75),
         PlotData(month: 5, value: 100),
         PlotData(month: 6, value: 50),
         PlotData(month: 7, value: 25),
         PlotData(month: 8, value: 100),
         PlotData(month: 9, value: 75),
        ]
    }
}
