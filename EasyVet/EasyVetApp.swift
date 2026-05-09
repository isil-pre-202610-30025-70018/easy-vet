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
    
    var body: some Scene {
        WindowGroup {
            OnBoarding()
                .environmentObject(viewModel)
        }
    }
}
