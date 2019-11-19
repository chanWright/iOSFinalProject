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
        addGroup(group: Groups(groupName: "Maths", functions: [Functions(functionName: "Pythagorean Theorem", formula:"A^2 + B^2 = c^2", variables: ["a","b","c"], results: [:]),Functions(functionName: "Subtract", formula: "a-b=Result", variables: ["a","b","c"], results: [:]),Functions(functionName: "Multiplication", formula: "a*b=Result", variables: ["a","b","c"], results: [:]),Functions(functionName: "Division", formula: "a/b=Result", variables: ["a","b","c"], results: [:])]))
        addGroup(group: Groups(groupName: "Physics", functions: [Functions(functionName: "Force", formula: "mass * accleration = Force", variables: ["Mass", "Acceleration","Force"], results: [:]),Functions(functionName: "Velocity", formula: "Distance/Time=Velocity", variables: ["Distance","Time","Velocity"], results: [:]),Functions(functionName: "Kinetic Energy", formula: "(mass * velocity^2)/2", variables: ["mass","velocity","Kinetic Energy"], results: [:])]))
        addGroup(group: Groups(groupName: "Chemistry", functions: [Functions(functionName: "Atomic Number", formula: "number of protons + number of nuetrons=Atomic Number", variables: ["Protons","Neutrons","Atomic Number"], results: [:])]))
        //addGroup(group: Groups(groupName: "Mischellenous", functions: []))
    }
}
