//
//  Groups.swift
//  FunctionCalculatoriOSFinal
//
//  Created by Student on 10/21/19.
//  Copyright © 2019 Wright,Chandler A. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Groups{
    var context:NSManagedObjectContext!
    var appDelegate:AppDelegate!
    var groupName:String
    private var functions:[Functions] = []
    
    init(groupName:String, functions:[Functions]){
        self.groupName = groupName
        self.functions = functions
    }
    
    func numOffunctions()->Int{
        return functions.count
    }
    
    func addFunction(function:Functions){
        functions.append(function)
        
//        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        appDelegate = UIApplication.shared.delegate as? AppDelegate
//
////        let historyTableRequest:NSFetchRequest<Function> = NSFetchRequest(entityName: "Function")
////        if let historyResults = try? context.fetch(historyTableRequest) {
////
//        let entity = NSEntityDescription.entity(forEntityName: "FunctionEntity", in: context)
//        let newFunction = NSManagedObject(entity: entity!, insertInto: context)
//        newFunction.setValue(function.functionName, forKey: "functionName")
//        newFunction.setValue(function.formula, forKey: "functionFormula")
//        do {
//           try context.save()
//          } catch {
//           print("Failed saving")
//        }
    }
    
//    func fetchFunctions(){
//        let request:NSFetchRequest<FunctionEntity> = NSFetchRequest(entityName: "FunctionEntity")
//        if let Functions1 = try? context.fetch(request) {
//            for i in Functions1{
//                print(i.functionName!,i.functionFormula!)
//            }
//
//        }
//    }
    
    func deleteFunction(at index:Int){
        functions.remove(at: index)
    }
    
    subscript(i:Int)->Functions{
        return functions[i]
    }
}
