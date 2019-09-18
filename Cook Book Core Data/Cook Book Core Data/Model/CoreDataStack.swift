//
//  CoreDataStack.swift
//  Cook Book Core Data
//
//  Created by Uptiie on 9/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

import CoreData
class CoreDataStack {
    static let shared = CoreDataStack()
    private init() {
        
    }
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Cookbook")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Error loading data from persistent stores: \(error)")
            }
        })
        return container
    }()
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    func saveToPersistentStore() {
        do {
            try mainContext.save()
        } catch {
            NSLog("Error saving context: \(error)")
            mainContext.reset()
        }
    }
}
