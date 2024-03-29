//
//  AddNewFunctionViewController.swift
//  FunctionCalculatoriOSFinal
//
//  Created by Student on 11/4/19.
//  Copyright © 2019 Wright,Chandler A. All rights reserved.
//

//This view controller handles adding new function to the Calculator class.
import UIKit

/// This view controller is user to add the user added formulas
class AddNewFunctionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var functionNameTF: UITextField!
    
    @IBOutlet weak var formulaTF: UITextField!
    
    @IBOutlet weak var functionType: UIPickerView!
    
    var pickerData:[String] = ["Maths","Physics","Chemistry","Miscellaneous"]
    let dictAccordance: [Character : Character] = ["(" : ")"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add New Function"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(add))
        
        // Connect data of picker view:
        self.functionType.delegate = self
        self.functionType.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    /// This function is used for string balanced parnthesis
    ///
    /// - Parameters:
    ///   - str: string formula
    ///   - dictAccordance: passing paranthesis
    /// - Returns: returns whather the string is balanced or not.
    func isBalanced(str: String, dictAccordance: [Character : Character]) -> Bool {
        var balArr: [Character] = []
        
        let keys = dictAccordance.keys // all keys (opening characters)
        let values = dictAccordance.values // all values (closing characters)
        
        for char in str.characters {
            
            switch char {
            // met char from keys. (Met opening character)
            case (let key) where keys.contains(char):
                balArr.append(key)
                
            // met char from values. (Met closing character)
            case (let value) where values.contains(char):
                let lastOpenedCharKey = balArr.removeLast() // key  of char
                // check last matching
                if dictAccordance[lastOpenedCharKey] != value {
                    return false
                }
            default:
                break
            }
        }
        
        return balArr.isEmpty
    }
    
    /// This method is used for displaying the alerts
    ///
    /// - Parameters:
    ///   - title: Title of the alert
    ///   - message: message of alert
    func alertMessage(title:String, message:String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        ac.addAction(action)
        self.present(ac,animated: true, completion: nil)
    }
    
    @objc func cancel(){
        self.dismiss(animated: true, completion: nil)
    }
    
    //Handles and processes all custom functions, then calls the addFunction method of Calculator
    @objc func add(){
        if functionNameTF.text!.isEmpty, formulaTF.text!.isEmpty{
            alertMessage(title: "Empty Fields", message: "Both the Text Fields are empty.")
        }
        else if !(functionNameTF.text!.isEmpty), formulaTF.text!.isEmpty{
            alertMessage(title: "Formula Text Field Error", message: "Formula Text Field is Empty.")
        }
        else if functionNameTF.text!.isEmpty, !(formulaTF.text!.isEmpty){
            alertMessage(title: "Function Name Text Field Error", message: "Function Name Text Field is Empty")
        }
        else if let function = Int(formulaTF.text!){
            alertMessage(title: "Formula Error", message: "The Formula should not be a Number.")
            
        }
        else if !(functionNameTF.text!.isEmpty), !(formulaTF.text!.isEmpty), isBalanced(str: formulaTF.text!, dictAccordance: dictAccordance){
            let testFormula = Array(Set(formulaTF.text!.components(separatedBy:CharacterSet.letters.inverted).filter{$0 != ""}))
            let testFunction = Functions(functionName: functionNameTF.text!, formula: formulaTF.text!, variables: testFormula, results: [:])
            if(!formulaTF.text!.contains("=") && testFunction.variables.count <= 7){
                var formula = Array(Set(formulaTF.text!.components(separatedBy:CharacterSet.letters.inverted).filter{$0 != ""}))
                formula.append("Result")
                
                switch pickerData[functionType.selectedRow(inComponent: 0)]{
                case "Maths": Calculator.shared[0].populateFunctionData(function: Functions(functionName: functionNameTF.text!, formula: formulaTF.text!, variables: formula, results: [:]))
                case "Physics": Calculator.shared[1].populateFunctionData(function: Functions(functionName: functionNameTF.text!, formula: formulaTF.text!, variables: formula, results: [:]))
                case "Chemistry": Calculator.shared[2].populateFunctionData(function: Functions(functionName: functionNameTF.text!, formula: formulaTF.text!, variables: formula, results: [:]))
                default: Calculator.shared[3].populateFunctionData(function: Functions(functionName: functionNameTF.text!, formula: formulaTF.text!, variables: formula, results: [:]))
                }
                NotificationCenter.default.post(Notification(name: Notification.Name("Incoming")))
                self.dismiss(animated: true, completion: nil)
            }
            else{
                alertMessage(title: "Formula Error", message: "Not a valid funtion or has more variable than allowed")
            }
        }
        else{
            alertMessage(title: "Formula Error", message: "paranthesis in formula is not balanced correctly.")
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerData[row])
    }
}
