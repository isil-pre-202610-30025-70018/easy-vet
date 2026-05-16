//
//  ProductService.swift
//  EasyVet
//
//  Created by Jorge Mayta on 16/05/26.
//

import Foundation

class ProductService {
    
    static let shared = ProductService()
    
    private init() {}
    
    func getProducts(completion: @escaping ([Product]) -> Void) {
        
        let endpoint = "https://petapi-591531460223.us-central1.run.app/api/products"
        
        guard let url = URL(string: endpoint) else {
            completion([])
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                completion([])
                return
            }
            
            guard let data = data else {
                completion([])
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            do {
                let response = try JSONDecoder().decode(ProductsResponseDto.self, from: data)
                let products = response.products.map { dto in
                    Product(id: dto.id, name: dto.title, price: dto.price, image: dto.image)
                }
                completion(products)
                
            } catch {
                completion([])
            }
        }
        
        task.resume()
        
        
        
    }
    
}
