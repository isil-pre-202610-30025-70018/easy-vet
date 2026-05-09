//
//  Home.swift
//  EasyVet
//
//  Created by Jorge Mayta on 25/04/26.
//

import SwiftUI

struct Home: View {
    
    let products = [
        Product(id: 1, name: "Royal Canin Maxi Puppy", price: 42.5, image: "https://i.imgur.com/WkZEOU6.png"),
        Product(id: 2, name: "Eukanuba Active Adult", price: 72.99, image: "https://i.imgur.com/guSk1sh.png"),
        Product(id: 3, name: "Whiskas Adult Chicken Flavor", price: 25.9, image: "https://i.imgur.com/dRC9dEB.png")
    ]
    
    var body: some View {
        List {
            ForEach(products) { product in
                ProductItem(product: product)
                    .frame(maxWidth: .infinity)
                
            }
        }
        .listStyle(.plain)
    }
}


#Preview {
    Home()
}
