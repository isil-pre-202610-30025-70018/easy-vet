//
//  ProductRepository.swift
//  EasyVet
//
//  Created by Jorge Mayta on 30/05/26.
//

class ProductRepository {
    private let productService = ProductService.shared
    private let productDao = ProductDao.shared
    
    
    func getAllProducts() -> [Product] {
        let entities = productDao.getProducts()
        
        return entities.map { entity in
            guard let name = entity.name,
                  let image = entity.image
            else {
                fatalError()
            }
            return Product(
                id: Int(entity.id),
                name: name,
                price: entity.price,
                image: image,
                isFavorite: entity.isFavorite)
            
        }
    }
    
    func syncProducts(completion: @escaping([Product])-> Void) {
        
        productService.getProducts { dtos in
            self.productDao.deleteAllProducts()
            
            dtos.forEach { productDto in
                let product = Product(id: productDto.id,
                                      name: productDto.title,
                                      price: productDto.price,
                                      image: productDto.image,
                                      isFavorite: false)
                self.productDao.addProduct(product: product)
                
            }
            
            let products = self.getAllProducts()
            completion(products)
        }
    }
}
