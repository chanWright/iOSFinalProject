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
        
        
        }
    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "History"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: nil)
        //fetchHistory()
        tableView.reloadData()
        
        

    }
//    func fetchHistory(){
//        //create request
//        let request: NSFetchRequest<History> = NSFetchRequest(entityName: "History")
//        //fetch the data into an array, results - if it failsm the if is skipped
//        if let history = try? context.fetch(request) {
//            for dbitem in history{
//                let tempFunc = Functions(functionName: dbitem.funcName ?? "Error", formula: dbitem.formula ?? "Undefined", variables: dbitem.values)
//                HistoryModel.shared.addHistory(tempFunc)
//                for historyitem in dbitem{
//                    dbitem.values =
//                }
//
//            }
//        }
//    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return HistoryModel.shared.numOfHistory()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyTableCell", for: indexPath)
        // Configure the cell...
        let history = HistoryModel.shared[indexPath.row]
        cell.textLabel?.text = history.functionName
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            HistoryModel.shared.deleteHistory(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
