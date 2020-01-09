//
//  CoreDataHelper.swift
//  natrali
//
//  Created by Anika Morris on 1/9/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
    // set up context to be able to save product
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    // instantiate new video and add to Core Data BUT NOTHINGS WORKING BC I SUCK AT NAMING
//    static func newVideo() -> Video {
//        let video = NSEntityDescription.insertNewObject(forEntityName: "Video", into: context) as! Video
//
//        return video
//    }
//
//    // save context
//    static func saveVideo() {
//        do {
//            try context.save()
//        } catch let error {
//            print("Could not save \(error.localizedDescription)")
//        }
//    }
//
//    // delete product
//    static func delete(video: Video) {
//        context.delete(video)
//        saveVideo()
//    }
//
//    // read from Core Data to retrieve products
//    static func retrieveVideos() -> [Video] {
//        do {
//            let fetchRequest = NSFetchRequest<Video>(entityName: "Video")
//            let results = try context.fetch(fetchRequest)
//
//            return results
//        } catch let error {
//            print("Could not fetch \(error.localizedDescription)")
//
//            return []
//        }
//    }
}
