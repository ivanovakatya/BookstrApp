//
//  CoreDataManager.swift
//  MyReadingList
//
//  Created by MacBook on 29/01/2022.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "MyReadingList")
        persistentContainer.loadPersistentStores { (description,error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    
    func saveBook(title: String) {
        let book = Book(context: persistentContainer.viewContext)
        book.title = title
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Fail to save the book\(error)")
        }
    }
}
