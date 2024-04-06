//
//  OpeninAppTaskAmanApp.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 05/04/24.
//

import SwiftUI

@main
struct OpeninAppTaskAmanApp: App {
    @StateObject var appViewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainTabView().environmentObject(appViewModel)
        }
    }
}
