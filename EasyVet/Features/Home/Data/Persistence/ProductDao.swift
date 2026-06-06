//
//  ProductDao.swift
//  EasyVet
//
//  Created by Jorge Mayta on 30/05/26.
//

import CoreData
import Foundation


class ProductDao {
    static let shared = ProductDao()
    private init() { }
    
    private let context = PersistenceController.shared.container.viewContext
    
    func getProducts() -> [ProductEntity] {
        let fechRequest: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        
        guard let entities = try? context.fetch(fechRequest) else {
            return []
        }
        return entities
    }
    
    func addProduct(product: Product) {
        let entity = ProductEntity(context: context)
        entity.id = Int16(product.id)
        entity.name = product.name
        entity.price = product.price
        entity.isFavorite = product.isFavorite
        entity.image = product.image
        saveContext()
    }
    
    func deleteAllProducts() {
        
        let fechRequest: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()

        if let entities = try? context.fetch(fechRequest) {
            entities.forEach { entity in
                context.delete(entity)
            }
            saveContext()
        }
    }
    
    
    private func saveContext() {
        if context.hasChanges {
            try? context.save()
        }
    }
}

