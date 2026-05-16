//
//  Home.swift
//  EasyVet
//
//  Created by Jorge Mayta on 25/04/26.
//

import SwiftUI

struct Home: View {

    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.products) { product in
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
