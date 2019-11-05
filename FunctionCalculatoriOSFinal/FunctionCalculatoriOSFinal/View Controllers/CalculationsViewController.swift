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
    
    @IBOutlet weak var variableDTF: UITextField!
    
    @IBOutlet weak var variableETF: UITextField!
    
    @IBOutlet weak var variableFTF: UITextField!
    
    @IBOutlet weak var variableGTF: UITextField!
    
    @IBOutlet weak var variableHTF: UITextField!
    
    @IBOutlet weak var functionImage: UIImageView!
    
    @IBOutlet weak var varALBL: UILabel!
    
    @IBOutlet weak var varBLBL: UILabel!
    
    @IBOutlet weak var varCLBL: UILabel!
    
    @IBOutlet weak var varDLBL: UILabel!
    
    @IBOutlet weak var varELBL: UILabel!
    
    @IBOutlet weak var varFLBL: UILabel!
    
    @IBOutlet weak var varGLBL: UILabel!
    
    @IBOutlet weak var varHLBL: UILabel!
    
    @IBAction func reset(_ sender: UIButton) {
        variableATF.text = ""
        variableBTF.text = ""
        variableCTF.text = ""
        variableCTF.text = ""
        variableDTF.text = ""
        variableETF.text = ""
        variableFTF.text = ""
        variableGTF.text = ""
        variableHTF.text = ""
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
        functionImage.image = UIImage(named: function.functionName)
        switch function.variables.count{
        case 2:
            self.variableCTF.isHidden = true
            self.variableDTF.isHidden = true
            self.variableETF.isHidden = true
            self.variableFTF.isHidden = true
            self.variableGTF.isHidden = true
            self.variableHTF.isHidden = true
            
            self.varCLBL.isHidden = true
            self.varDLBL.isHidden = true
            self.varELBL.isHidden = true
            self.varFLBL.isHidden = true
            self.varGLBL.isHidden = true
            self.varHLBL.isHidden = true
            
            varALBL.text = function.variables[0]
            varBLBL.text = function.variables[1]
            break
        case 3:
            self.variableDTF.isHidden = true
            self.variableETF.isHidden = true
            self.variableFTF.isHidden = true
            self.variableGTF.isHidden = true
            self.variableHTF.isHidden = true
            
            self.varDLBL.isHidden = true
            self.varELBL.isHidden = true
            self.varFLBL.isHidden = true
            self.varGLBL.isHidden = true
            self.varHLBL.isHidden = true
            
            varALBL.text = function.variables[0]
            varBLBL.text = function.variables[1]
            varCLBL.text = function.variables[2]
            break
        case 4:
            self.variableETF.isHidden = true
            self.variableFTF.isHidden = true
            self.variableGTF.isHidden = true
            self.variableHTF.isHidden = true
            
            self.varELBL.isHidden = true
            self.varFLBL.isHidden = true
            self.varGLBL.isHidden = true
            self.varHLBL.isHidden = true
            
            varALBL.text = function.variables[0]
            varBLBL.text = function.variables[1]
            varCLBL.text = function.variables[2]
            varDLBL.text = function.variables[3]
            break
        case 5:
            self.variableFTF.isHidden = true
            self.variableGTF.isHidden = true
            self.variableHTF.isHidden = true
            
            self.varFLBL.isHidden = true
            self.varGLBL.isHidden = true
            self.varHLBL.isHidden = true
            
            varALBL.text = function.variables[0]
            varBLBL.text = function.variables[1]
            varCLBL.text = function.variables[2]
            varDLBL.text = function.variables[3]
            varELBL.text = function.variables[4]
            break
        case 6:
            self.variableGTF.isHidden = true
            self.variableHTF.isHidden = true
            
            self.varGLBL.isHidden = true
            self.varHLBL.isHidden = true
            
            varALBL.text = function.variables[0]
            varBLBL.text = function.variables[1]
            varCLBL.text = function.variables[2]
            varDLBL.text = function.variables[3]
            varELBL.text = function.variables[4]
            varFLBL.text = function.variables[5]
            break
        case 7:
            self.variableHTF.isHidden = true

            self.varHLBL.isHidden = true
            
            varALBL.text = function.variables[0]
            varBLBL.text = function.variables[1]
            varCLBL.text = function.variables[2]
            varDLBL.text = function.variables[3]
            varELBL.text = function.variables[4]
            varFLBL.text = function.variables[5]
            varGLBL.text = function.variables[6]
            break
        default:
            varALBL.text = function.variables[0]
            varBLBL.text = function.variables[1]
            varCLBL.text = function.variables[2]
            varDLBL.text = function.variables[3]
            varELBL.text = function.variables[4]
            varFLBL.text = function.variables[5]
            varGLBL.text = function.variables[6]
            varHLBL.text = function.variables[7]
            break
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = function.functionName
    }
}
