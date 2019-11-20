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
    private var history:[Functions] = []
    
    private init(history:[Functions]){
        self.history = history
    }
    
    func numOfHistory()->Int{
        return history.count
    }
    
    func addHistory(_ history:Functions){
        //Stores item in CoreData
        var context:NSManagedObjectContext!
        var appDelegate:AppDelegate!
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        //historyItem is an object representing an entry to be added to the CoreData store.
        let historyItem = NSEntityDescription.insertNewObject(forEntityName: "History", into: context) as! History
        historyItem.formula = history.formula
        historyItem.funcName = history.functionName
        
        //for each [variable, value] pair in a history (Function) object.
        for variablePair in history.results{
            let variableItem = NSEntityDescription.insertNewObject(forEntityName: "Value", into: context) as! Value
            variableItem.variable = variablePair.key
            variableItem.variableValue = variablePair.value
            historyItem.addToValues(variableItem)
        }
        appDelegate.saveContext()
        //appends to local cache of history.
        self.history.append(history)
    }
    
   
    
    
    func deleteOneHistory(at index:Int){
        history.remove(at: index)
    }
    
    func deleteFullHistory(){
        history.removeAll()
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
