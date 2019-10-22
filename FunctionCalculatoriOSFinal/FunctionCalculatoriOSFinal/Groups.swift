//
//  Groups.swift
//  FunctionCalculatoriOSFinal
//
//  Created by Student on 10/21/19.
//  Copyright © 2019 Wright,Chandler A. All rights reserved.
//

import Foundation

class Groups{
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
    }
    
    func deleteFunction(at index:Int){
        functions.remove(at: index)
    }
    
    subscript(i:Int)->Functions{
        return functions[i]
    }
}
