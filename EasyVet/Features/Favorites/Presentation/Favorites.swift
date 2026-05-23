//
//  Favorites.swift
//  EasyVet
//
//  Created by Jorge Mayta on 25/04/26.
//

import SwiftUI

struct Favorites: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    var body: some View {
        List {
            ForEach(viewModel.favoriteProducts) { product in
                Text(product.name)
            }
        }
    }
}


