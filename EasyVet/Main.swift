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
                Home()
            }
            
            Tab("Cart", systemImage: "cart") {
                Home()
            }
            
            Tab("Profile", systemImage: "person") {
                Home()
            }
        }
        .tint(.green)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Main()
}
