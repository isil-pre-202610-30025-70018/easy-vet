//
//  Cart.swift
//  EasyVet
//
//  Created by Jorge Mayta on 25/04/26.
//

import SwiftUI

struct Cart: View {
    
    @EnvironmentObject private var viewModel: CartViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.products) { product in
                Text(product.name)
                    .swipeActions(edge: .trailing, content: {
                        Button(role: .destructive) {
                            viewModel.removeProduct(product: product)
                        }
                    })
            }
        }
    }
}
