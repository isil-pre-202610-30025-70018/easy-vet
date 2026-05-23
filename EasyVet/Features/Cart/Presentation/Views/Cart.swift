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
        
        Group {
            if (viewModel.products.isEmpty) {
                VStack {
                    Text("No products in cart")
                }
            } else {
                VStack {
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
                    Spacer()
                    HStack {
                        Text("Total: ")
                        Spacer()
                        Text("\(viewModel.total, specifier: "%.2f")")
                    }
                    .padding()
                }
            }
        }
       
        
    }
}
