//
//  functionClass.swift
//  FunctionCalculatoriOSFinal
//
//  Created by mike on 10/5/19.
//  Copyright © 2019 Wright,Chandler A. All rights reserved.
//

import Foundation

struct functionItem {
    var name: String
    var formula:String
    var variables: [String]
    // other properties omitted .. this is just a demo
}

class Function {
    var name:String!
    var formula:String!
    var function:[functionItem] = []
    
    init(name:String, formula:String, function:[functionItem] = []){
        self.name = name
        self.formula = formula
        self.function = function
    }
    // just a convenience so we can access each restaurant's menu more easily
    subscript (i:Int) -> functionItem {
        return function[i]
    }
}

class functionTable {
    
    private static var _shared:functionTable!
    static var shared:functionTable {
        if _shared == nil {
            _shared = functionTable()
        }
        return _shared
    }
    
    private init(){}
    
    subscript(i:Int) -> functionItem {
        return function[i]
    }
    
    func numFunction() -> Int {
        return function.count
    }
    
    private var function = [
        functionItem(name: "Pythagorean Theorm", formula: "A^2 + B^2 = C^2", variables: ["A", "B", "C"])
    ]
    
    func add(function:functionItem){
        self.function.append(function)
    }
    
    func deleteRestaurant(index:Int) {
        function.remove(at: index)
    }
    
}

