//
//  Main.swift
//  EasyVet
//
//  Created by Jorge Mayta on 25/04/26.
//

import SwiftUI

struct Main: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                Home()
            }
            
            Tab("Favorites", systemImage: "heart") {
                Favorites()
            }
            
            Tab("Cart", systemImage: "cart") {
                Cart()
            }
            
            Tab("Profile", systemImage: "person") {
                Profile()
            }
        }
        .tint(.green)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Main()
}
