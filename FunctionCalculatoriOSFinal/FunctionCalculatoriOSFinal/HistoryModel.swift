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

///HistoryModel is in charge of handling all previously ran functions. It stores Functions,
class HistoryModel{
    var context:NSManagedObjectContext!
    var appDelegate:AppDelegate!
    var ID:Int16 = 0
    
    
    private var history:[Functions] = []
    
    private init(history:[Functions],ID:Int16){
        self.history = history
        self.ID = ID
    }
    ///returns the number of Functions previously calculated.
    func numOfHistory()->Int{
        return history.count
    }
    
    func populateDatabase(_ history:Functions){
        self.history.append(history)
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        //historyItem is an object representing an entry to be added to the CoreData store.
        let historyTableRequest:NSFetchRequest<History> = NSFetchRequest(entityName: "History")
        if let historyResults = try? context.fetch(historyTableRequest) {
            
            let historyItem = NSEntityDescription.insertNewObject(forEntityName: "History", into: context) as! History
            ID = Int16(historyResults.count + 1)
            historyItem.uniqueID = ID
            historyItem.formula = history.formula
            historyItem.funcName = history.functionName
            
            //for each [variable, value] pair in a history (Function) object.
            var results:[String:Double] = [:]
            print(history.results.count)
            for variablePair in history.results{
                let variableItem = NSEntityDescription.insertNewObject(forEntityName: "Value", into: context) as! Value
                print(ID)
                variableItem.id = ID
                variableItem.variable = variablePair.key
                variableItem.variableValue = variablePair.value
//                print(variableItem.variable,variableItem.variableValue)
                results[variableItem.variable!] = variableItem.variableValue
                historyItem.addToValues(variableItem)
                appDelegate.saveContext()
            }
            
        }
    }
    
    ///Adds a function to history.
    func addHistory(_ history:Functions){
        self.history.append(history)
    }
    
    ///deletes a specific Function from history. Takes in an index position in the history array.
    func deleteOneHistory(at index:Int){
        history.remove(at: index)
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        let historyTableRequest:NSFetchRequest<History> = NSFetchRequest(entityName: "History")
        let valueTableRequest:NSFetchRequest<Value> = NSFetchRequest(entityName: "Value")
        
        if let historyResults = try? context.fetch(historyTableRequest) {
            if let valueResults = try? context.fetch(valueTableRequest) {
                for i in valueResults{
                    if i.id == historyResults[index].uniqueID{
                        context.delete(i)
                        appDelegate.saveContext()
                    }
                }
            }
            context.delete(historyResults[index])
            appDelegate.saveContext()
        }
        
    }
    ///Deletes all history from the local history storage and the CoreData database. 
    func deleteFullHistory(){
        history.removeAll()
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        let historyTableRequest:NSFetchRequest<History> = NSFetchRequest(entityName: "History")
        let valueTableRequest:NSFetchRequest<Value> = NSFetchRequest(entityName: "Value")
        
        if let historyResults = try? context.fetch(historyTableRequest) {
            for i in historyResults{
                context.delete(i)
                appDelegate.saveContext()
            }
        }
        if let valueResults = try? context.fetch(valueTableRequest) {
            for i in valueResults{
                context.delete(i)
                appDelegate.saveContext()
            }
        }
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
