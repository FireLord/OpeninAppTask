//
//  AlertItem.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 06/04/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    // MARK: Network Alerts
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data received from the server was invalid. Please contact support"),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                       message: Text("Invalid response from server. Please try again later or contact support"),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                       message: Text("There was an issue connecting to the server. Please contact support"),
                                       dismissButton: .default(Text("OK")))
    
    static let noInternetConnection = AlertItem(title: Text("Server Error"),
                                       message: Text("Make sure you are connected to internet"),
                                       dismissButton: .default(Text("OK")))
}
