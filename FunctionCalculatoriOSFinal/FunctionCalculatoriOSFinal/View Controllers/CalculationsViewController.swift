//
//  CalculationsViewController.swift
//  FunctionCalculatoriOSFinal
//
//  Created by Student on 10/3/19.
//  Copyright © 2019 Wright,Chandler A. All rights reserved.
//

import UIKit

class CalculationsViewController: UIViewController {
    
    var function:Functions!
    
    @IBOutlet weak var variableATF: UITextField!
    
    @IBOutlet weak var variableBTF: UITextField!
    
    @IBOutlet weak var variableCTF: UITextField!
    
    @IBAction func reset(_ sender: UIButton) {
        variableATF.text = ""
        variableBTF.text = ""
        variableCTF.text = ""
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        if variableATF.text!.isEmpty, variableBTF.text!.isEmpty, variableCTF.text!.isEmpty{
            alertMessage(title: "Three Text Fields Shouldn't be Empty", message: "You Must only fill any two fields")
        }
        else if (variableATF.text!.isEmpty && variableBTF.text!.isEmpty) || (variableBTF.text!.isEmpty && variableCTF.text!.isEmpty) || (variableCTF.text!.isEmpty && variableATF.text!.isEmpty){
            alertMessage(title: "Two Text Fields Shouldn't be Empty", message: "One must fill One more Text Field")
        }
        else if variableCTF.text!.isEmpty, let a = Double(variableATF.text!), let b = Double(variableBTF.text!){
            variableCTF.text = String(format: "%.2f", ((pow(a, 2) + pow(b, 2)).squareRoot()))
            print(a,b,variableCTF.text!)
            HistoryModel.shared.addHistory(Functions(functionName: function.functionName, formula: "", variables: []))
        }
        else if variableBTF.text!.isEmpty, let c = Double(variableCTF.text!), let a = Double(variableATF.text!){
            variableBTF.text = String(format: "%.2f", ((pow(c, 2) - pow(a, 2)).squareRoot()))
            print(a, variableBTF.text!, c)
            HistoryModel.shared.addHistory(Functions(functionName: function.functionName, formula: "", variables: []))
        }
        else if variableATF.text!.isEmpty, let b = Double(variableBTF.text!), let c = Double(variableCTF.text!){
            variableATF.text = String(format: "%.2f", ((pow(c, 2) - pow(b, 2)).squareRoot()))
            print(variableATF.text!, b, c)
            HistoryModel.shared.addHistory(Functions(functionName: function.functionName, formula: "", variables: []))
        }
        else if !(variableATF.text!.isEmpty), !(variableBTF.text!.isEmpty), !(variableCTF.text!.isEmpty){
            let ac = UIAlertController(title: "Clear Text Fields!", message: "One Text Field should be Empty. Do you want to clear all the Text Fields ?", preferredStyle: .alert)
            let action = UIAlertAction(title: "Yes", style: .default, handler: {
                (action) in self.resetTF()
            })
            let action1 = UIAlertAction(title: "No", style: .default, handler: nil)
            ac.addAction(action)
            ac.addAction(action1)
            self.present(ac,animated: true, completion: nil)
        }
        else{
            alertMessage(title: "String Error", message: "The Text Fields Shouldn't contain characters. It should contain only Numericals.")
        }
    }
    
    func alertMessage(title:String, message:String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        ac.addAction(action)
        self.present(ac,animated: true, completion: nil)
    }
    
    func resetTF() {
        variableATF.text = ""
        variableBTF.text = ""
        variableCTF.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = function.functionName
    }
}
