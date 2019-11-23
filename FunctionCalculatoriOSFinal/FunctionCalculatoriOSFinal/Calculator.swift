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
    ///returns an element of type Group from the groups array.
    subscript(i:Int)->Groups{
        return groups[i]
    }
    ///Returns the number of Groups available in the calculator.
    func numberOfGroups()->Int{
        return groups.count
    }
    ///adds a group to the calculator.
    func addGroup(group:Groups){
        groups.append(group)
    }
    ///removes a group from the calculator.
    func deleteGroup(at index:Int){
        groups.remove(at: index)
    }
    //default functions.
    init(){
        addGroup(group: Groups(groupName: "Maths", functions: [Functions(functionName: "Pythagorean Theorem", formula:"A^2 + B^2 = c^2", variables: ["a","b","c"], results: [:]),Functions(functionName: "Subtract", formula: "a-b", variables: ["a","b","c"], results: [:]),Functions(functionName: "Multiplication", formula: "a*b", variables: ["a","b","c"], results: [:]),Functions(functionName: "Division", formula: "a/b", variables: ["a","b","c"], results: [:])]))
        addGroup(group: Groups(groupName: "Physics", functions: [Functions(functionName: "Force", formula: "mass * accleration", variables: ["Mass", "Acceleration","Force"], results: [:]),Functions(functionName: "Velocity", formula: "Distance/Time", variables: ["Distance","Time","Velocity"], results: [:]),Functions(functionName: "Kinetic Energy", formula: "(mass * velocity^2)/2", variables: ["mass","velocity","Kinetic Energy"], results: [:])]))
        addGroup(group: Groups(groupName: "Chemistry", functions: [Functions(functionName: "Atomic Number", formula: "No. protons + No. nuetrons", variables: ["Protons","Neutrons","Atomic Number"], results: [:])]))
        addGroup(group: Groups(groupName: "Miscellaneous", functions: []))
    }
}
