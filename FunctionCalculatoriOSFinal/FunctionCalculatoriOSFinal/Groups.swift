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
    ///Returns the number of functions in a group
    func numOffunctions()->Int{
        return functions.count
    }
    ///Adds a function to the Group
    func addFunction(function:Functions){
        functions.append(function)
    }
    ///deletes a function from the Group
    func deleteFunction(at index:Int){
        functions.remove(at: index)
    }
    
    subscript(i:Int)->Functions{
        return functions[i]
    }
}
