//
//  Functions.swift
//  FunctionCalculatoriOSFinal
//
//  Created by Student on 10/21/19.
//  Copyright © 2019 Wright,Chandler A. All rights reserved.
//

import Foundation
///The Functions struct is the data structure used for defining a calculated function. It consists of a function name, formula, variables, and the results of the function. This is used in the HistoryModel class.
struct Functions{
    var functionName:String
    var formula:String
    var variables:[String]
    var results : [String:Double]
}

