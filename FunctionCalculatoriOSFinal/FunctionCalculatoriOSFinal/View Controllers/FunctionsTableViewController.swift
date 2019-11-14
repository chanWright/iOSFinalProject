//
//  FunctionsTableViewController.swift
//  FunctionCalculatoriOSFinal
//
//  Created by Student on 10/3/19.
//  Copyright © 2019 Wright,Chandler A. All rights reserved.
//

import UIKit

class FunctionsTableViewController: UITableViewController {
    
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
        NotificationCenter.default.addObserver(self, selector: #selector(notifier), name: NSNotification.Name(rawValue:"Incoming"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @objc func edit(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"Fuctionality not added yet."), object: nil)
    }
    
    @objc func notifier(){
        self.tableView.reloadData()
    }
    
    @objc func add(){
        let navCon = storyboard?.instantiateViewController(withIdentifier: "AddNewFunctionNC")
        
        self.present(navCon!, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return Calculator.shared.numberOfGroups()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //MARK: -Dummy Data.
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
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
