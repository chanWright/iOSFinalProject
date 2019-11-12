////
////  Calculator.swift
////  FunctionCalculatoriOSFinal
////
////  Created by Student on 10/21/19.
////  Copyright © 2019 Wright,Chandler A. All rights reserved.
////
//
//import Foundation
//
class Calculator{
    private var groups:[Groups] = []
    
    private static var _shared:Calculator!
    
    static var shared:Calculator{
        if _shared == nil{
            _shared = Calculator()
        }
        return _shared
    }
    
    subscript(i:Int)->Groups{
        return groups[i]
    }
    
    func numberOfGroups()->Int{
        return groups.count
    }
    
    func addGroup(group:Groups){
        groups.append(group)
    }
    
    func deleteGroup(at index:Int){
        groups.remove(at: index)
    }
    
    init(){
        addGroup(group: Groups(groupName: "Maths", functions: [Functions(functionName: "Pythagorean Theorem", formula:"A^2 + B^2 = c^2", variables: ["a","b","c"]),Functions(functionName: "Subtract", formula: "a-b=Result", variables: ["a","b","Result"]),Functions(functionName: "Multiplication", formula: "a*b=Result", variables: ["a","b","Result"]),Functions(functionName: "Division", formula: "a/b=Result", variables: ["a","b","Result"])]))
        addGroup(group: Groups(groupName: "Physics", functions: [Functions(functionName: "Force", formula: "mass * accleration = Force", variables: ["mass", "acceleration","Force"]),Functions(functionName: "Velocity", formula: "Distance/Time=Velocity", variables: ["distance","time","velocity"]),Functions(functionName: "Kinetic Energy", formula: "(mass * velocity)/2", variables: ["mass","velocity","Kinetic Energy"])]))
        addGroup(group: Groups(groupName: "Chemistry", functions: [Functions(functionName: "Atomic Number", formula: "number of protons + number of nuetrons=Atomic Number", variables: ["protons","neutrons","Atomic Number"]),Functions(functionName: "K20",formula: " ", variables: []),Functions(functionName: "Li",formula: " ", variables: [])]))
        addGroup(group: Groups(groupName: "Mischellenous", functions: [Functions(functionName: "M", formula: " ", variables: []),Functions(functionName: "N", formula: " ", variables: [])]))
    }
}
