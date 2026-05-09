//
//  CartViewModel.swift
//  EasyVet
//
//  Created by Jorge Mayta on 9/05/26.
//

import Combine

class CartViewModel: ObservableObject {
    @Published private(set) var products = [Product]()
    
    
    func addProduct(product: Product) {
        products.append(product)
    }
    
    func removeProduct(product: Product) {
        products.removeAll { $0.id == product.id }
    }
    
}
