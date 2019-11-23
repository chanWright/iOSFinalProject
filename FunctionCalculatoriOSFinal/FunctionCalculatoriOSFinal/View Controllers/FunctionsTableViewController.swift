//
//  FunctionsTableViewController.swift
//  FunctionCalculatoriOSFinal
//
//  Created by Student on 10/3/19.
//  Copyright © 2019 Wright,Chandler A. All rights reserved.
//

import UIKit
import CoreData

/// This is a table view controller to display function name and its type
class FunctionsTableViewController: UITableViewController {
    
    var context:NSManagedObjectContext!
    var appDelegate:AppDelegate!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tabBarItem.title = "Functions"
        tabBarItem.image = UIImage(named:"function.png")
        
    }
    
    var group:Groups!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Functions"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        NotificationCenter.default.addObserver(self, selector: #selector(refresh), name: NSNotification.Name(rawValue:"Incoming"), object: nil)
        //fetchFunctions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    //This was functionality intended if we had time. We did not.
    @objc func edit(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"Fuctionality not supported."), object: nil)
    }
    
    ///reloads the tableView data.
    @objc func refresh(){
        self.tableView.reloadData()
    }
    
    /// This objc function is used to navigate to the Add new function navigation controller.
    @objc func add(){
        let navCon = storyboard?.instantiateViewController(withIdentifier: "AddNewFunctionNC")
        
        self.present(navCon!, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Calculator.shared.numberOfGroups()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //returns number of rows.
        return Calculator.shared[section].numOffunctions()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Calculator.shared[section].groupName
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "functionTable", for: indexPath)
        let function = Calculator.shared[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = function.functionName
        // Configure the cell...
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let calculationVC = storyboard!.instantiateViewController(withIdentifier: "CalculationsViewController") as! CalculationsViewController
        
        calculationVC.function = Calculator.shared[indexPath.section][indexPath.row]
        self.navigationController!.pushViewController(calculationVC, animated: true)
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            Calculator.shared[indexPath.section].deleteFunction(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        else if editingStyle == .insert {
        }
    }
    
    /// This function is used to fetch the data from the FunctionEntity table
    func fetchFunctions(){
        let request:NSFetchRequest<FunctionEntity> = NSFetchRequest(entityName: "FunctionEntity")
        if let fetchedData = try? context.fetch(request) {
            for i in fetchedData{
                Calculator.shared.addGroup(group: Groups(groupName: i.functionType!, functions: [Functions(functionName: i.functionName!, formula: i.functionFormula!, variables: [], results: [:])]))
            }
            
        }
    }
}
