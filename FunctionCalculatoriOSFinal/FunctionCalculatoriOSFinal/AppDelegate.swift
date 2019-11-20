//
//  AppDelegate.swift
//  Countries and Rivers
//
//  Created by Michael Rogers on 9/1/18.
//  Copyright © 2018 Michael Rogers. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var context:NSManagedObjectContext!
    var appDelegate:AppDelegate!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        
        //sample data feeder. Doesn't have attached object???
//        let sampleData = NSEntityDescription.insertNewObject(forEntityName: "History", into: context) as! History
//        sampleData.formula = "TEST FORMULA"
//        sampleData.funcName = "TEST FUNCTION NAME"
//        let sampleValue = NSEntityDescription.insertNewObject(forEntityName: "Value", into: context) as! Value
//        sampleValue.variable = "a"
//        sampleValue.variableValue = 1231112.1
//        sampleData.values?.adding(sampleValue)
//        appDelegate.saveContext()
        
        
        
        
        let request:NSFetchRequest<History> = NSFetchRequest(entityName: "History")
        //push the data into an array, if it can't if is skipped
        
        
        if let histories = try? context.fetch(request){
            for history in histories{
                print(history.funcName)
                print(history.values)
                
//                let tempHistoryObject:Functions = Functions(functionName: history.funcName ?? "Function Name Error", formula: history.formula ?? "Formula Error", variables: [""], results: pairs)
                //retrieve variable and value from history and store them in the tempHistoryObject
                //for each pair in history.values (String, Double)
                
//                HistoryModel.shared.addHistory(tempHistoryObject)
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Database")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

