//
//  PersistenceController.swift
//  EasyVet
//
//  Created by Jorge Mayta on 30/05/26.
//

import CoreData

class PersistenceController {
    
    static var shared: PersistenceController = PersistenceController()
    
    let container: NSPersistentContainer
    
    private init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "EasyVetModel")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
}
