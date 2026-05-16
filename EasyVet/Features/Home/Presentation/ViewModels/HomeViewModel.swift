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
    
    let service = ProductService.shared

    func getProducts() {
        service.getProducts() {products in
            DispatchQueue.main.async {
                self.products = products
            }
        }
    }
    
    init() {
        getProducts()
    }
}
