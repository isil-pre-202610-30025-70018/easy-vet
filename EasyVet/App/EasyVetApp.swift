//
//  EasyVetApp.swift
//  EasyVet
//
//  Created by Jorge Mayta on 18/04/26.
//

import SwiftUI

@main
struct EasyVetApp: App {
    @StateObject var viewModel = CartViewModel()
    
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            OnBoarding()
                .environmentObject(viewModel)
                .environmentObject(homeViewModel)
        }
    }
}
