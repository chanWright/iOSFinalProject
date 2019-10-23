//
//  HistoryModel.swift
//  FunctionCalculatoriOSFinal
//
//  Created by Student on 10/22/19.
//  Copyright © 2019 Wright,Chandler A. All rights reserved.
//

import Foundation

class HistoryModel{
    private var history:[Functions] = []
    
    private init(history:[Functions]){
        self.history = history
    }
    
    func numOfHistory()->Int{
        return history.count
    }
    
    func addHistory(history:Functions){
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
