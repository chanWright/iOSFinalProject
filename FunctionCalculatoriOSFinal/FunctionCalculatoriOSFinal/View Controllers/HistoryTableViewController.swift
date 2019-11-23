//
//  HistoryTableViewController.swift
//  FunctionCalculatoriOSFinal
//
//  Created by Student on 10/3/19.
//  Copyright © 2019 Wright,Chandler A. All rights reserved.
//

import UIKit
import CoreData

class HistoryTableViewController: UITableViewController {
    
    var context:NSManagedObjectContext!
    var appDelegate:AppDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tabBarItem.title = "History"
        tabBarItem.image = UIImage(named:"history.png")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        fetchResults()
    }
    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "History"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trash))
        tableView.reloadData()
        
    }
    
    
    
    //Handles deletion of the whole local HistoryModel record. These changes are saved, and are permanent. 
    @objc func trash(){
        if HistoryModel.shared.numOfHistory() > 0{
            let ac = UIAlertController(title: "Deleting History!", message: "Do you want to clean your Entire history?", preferredStyle: .alert)
            let action = UIAlertAction(title: "Yes", style: .default, handler: {
                (action) in HistoryModel.shared.deleteFullHistory()
                self.tableView.reloadData()
            })
            let action1 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(action)
            ac.addAction(action1)
            self.present(ac,animated: true, completion: nil)
        }
        else{
            alertMessage(title: "Deleting History!", message: "There is no History to delete.")
        }
    }
    ///fetchResults() will make an NSFetchRequest to the CoreData database and populate append it to the local history array located in HistoryModel.
    func fetchResults(){

        var results:[String:Double] = [:]
        
        let requestHistoryTable:NSFetchRequest<History> = NSFetchRequest(entityName: "History")
        let requestValueTable:NSFetchRequest<Value> = NSFetchRequest(entityName: "Value")
        
        if let histories = try? context.fetch(requestHistoryTable){
            for history in histories{
                print(history.uniqueID, history.funcName!, history.formula!)
                if let values = try? context.fetch(requestValueTable){
                    for value in values{
                        if value.id == history.uniqueID{
                        print(value.id, value.variable!, value.variableValue)
                        results[value.variable!] = value.variableValue
                        }
                    }
                    
                    HistoryModel.shared.addHistory(Functions(functionName: history.funcName!, formula: history.formula!, variables: [], results: results))
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        //returns the number of sections. Should always be 1.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //returns the number of rows
        return HistoryModel.shared.numOfHistory()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyTableCell", for: indexPath)
        // Configure the cell...
        let history = HistoryModel.shared[indexPath.row]
        cell.textLabel?.text = history.functionName
        cell.detailTextLabel?.text = ""
        for (key,value) in history.results{
            cell.detailTextLabel?.text! += "\(key): \(value) \t"
        }
        return cell
    }
    
    func alertMessage(title:String, message:String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        ac.addAction(action)
        self.present(ac,animated: true, completion: nil)
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            HistoryModel.shared.deleteOneHistory(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
