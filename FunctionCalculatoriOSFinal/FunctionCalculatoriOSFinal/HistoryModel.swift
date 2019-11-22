//
//  HistoryModel.swift
//  FunctionCalculatoriOSFinal
//
//  Created by Student on 10/22/19.
//  Copyright © 2019 Wright,Chandler A. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class HistoryModel{
    var context:NSManagedObjectContext!
    var appDelegate:AppDelegate!
    var ID:Int16 = 0
    
    
    private var history:[Functions] = []
    
    private init(history:[Functions]){
        self.history = history
    }
    
    func numOfHistory()->Int{
        return history.count
    }
    
    func populateDatabase(){
        
    }
    
    
    func addHistory(_ history:Functions){
        self.history.append(history)
        //Stores item in CoreData
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        //historyItem is an object representing an entry to be added to the CoreData store.
        
        let historyItem = NSEntityDescription.insertNewObject(forEntityName: "History", into: context) as! History
        ID += 1
        historyItem.uniqueID = ID
        historyItem.formula = history.formula
        historyItem.funcName = history.functionName
        
        //for each [variable, value] pair in a history (Function) object.
        var results:[String:Double] = [:]
        for variablePair in history.results{
            let variableItem = NSEntityDescription.insertNewObject(forEntityName: "Value", into: context) as! Value
            variableItem.id = ID
            variableItem.variable = variablePair.key
            variableItem.variableValue = variablePair.value
            results[variableItem.variable!] = variableItem.variableValue
            historyItem.addToValues(variableItem)
        }
        appDelegate.saveContext()
        //self.history.append(Functions(functionName: history.functionName, formula: history.formula, variables: history.variables, results: results))
        //appends to local cache of history.
    }
    
    func deleteOneHistory(at index:Int){
        history.remove(at: index)
        let historyTableRequest:NSFetchRequest<History> = NSFetchRequest(entityName: "History")
        let valueTableRequest:NSFetchRequest<Value> = NSFetchRequest(entityName: "Value")
        
        if let historyResults = try? context.fetch(historyTableRequest) {
            context.delete(historyResults[index])
            appDelegate.saveContext()
        }
        if let valueResults = try? context.fetch(valueTableRequest) {
            for i in valueResults{
                if i.id == index{
                context.delete(i)
                appDelegate.saveContext()
                }
            }
        }
        
    }
    
    func deleteFullHistory(){
        history.removeAll()
        //        let request:NSFetchRequest<History> = NSFetchRequest(entityName: "History")
        //
        //        if let results = try? context.fetch(request) {
        //            for resultIndex in 0..<results.count{
        //                context.delete(results[resultIndex])
        //                appDelegate.saveContext()
        //            }
        //        }
    }
    
    subscript(i:Int)->Functions{
        return history[i]
    }
    
    private static var _shared:HistoryModel!
    
    static var shared:HistoryModel{
        if _shared == nil{
            _shared = HistoryModel()
        }
        return _shared
    }
    private init(){
        
    }
}
