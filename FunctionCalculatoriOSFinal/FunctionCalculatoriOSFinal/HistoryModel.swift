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
    @NSManaged public var values: NSSet?
    private var history:[Functions] = []
    
    private init(history:[Functions]){
        self.history = history
    }
    
    func numOfHistory()->Int{
        return history.count
    }
    
    func addHistory(_ history:Functions){
        var context:NSManagedObjectContext!
        var appDelegate:AppDelegate!
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let historyItem = NSEntityDescription.insertNewObject(forEntityName: "History", into: context) as! History
        historyItem.formula = history.formula
        historyItem.funcName = history.functionName
        for variable in history.variables{
            let variableItem = NSEntityDescription.insertNewObject(forEntityName: "Value", into: context) as! Value
            variableItem.variable = variable
//            historyItem.values
        }
        
        
        appDelegate.saveContext()
        
        self.history.append(history)
    }
    
    func deleteHistory(at index:Int){
        history.remove(at: index)
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
