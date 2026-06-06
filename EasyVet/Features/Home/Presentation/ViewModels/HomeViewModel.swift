//
//  HomeViewModel.swift
//  EasyVet
//
//  Created by Jorge Mayta on 16/05/26.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    private let repository = ProductRepository()
    
    
    var favoriteProducts : [Product] {
        products.filter({$0.isFavorite})
    }
    
    let service = ProductService.shared

    func getProducts() {
        self.products = repository.getAllProducts()
    }
    
    func syncProducts() {
        repository.syncProducts { products in
            DispatchQueue.main.async {
                self.products = products
            }
        }
    }
    
    func togglefavorite(id: Int) {
        products = products.map { product in
            if product.id == id {
                Product(id: product.id, name: product.name, price: product.price, image: product.image, isFavorite: !product.isFavorite)
            } else {
                product
            }
        }
    }
    
  
    
    init() {
        getProducts()
        syncProducts()
    }
}
