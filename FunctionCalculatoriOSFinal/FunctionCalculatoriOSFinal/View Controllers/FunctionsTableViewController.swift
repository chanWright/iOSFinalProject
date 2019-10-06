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
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: -THIS NEEDS TO BE FIXED.
        //      I cannot get this to show up on the table view. It may be in the wrong place or it's written wrong.
        navigationItem.rightBarButtonItem = self.editButtonItem
        navigationItem.title = "Functions"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(edit))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        
    }
    
    @objc func edit(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"Fuctionality not added yet."), object: nil)
    }
    
    @objc func add(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"Fuctionality not added yet."), object: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //MARK: -Dummy Data.

        return functionTable.shared.numFunction()
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "functionTable", for: indexPath)
        let function = functionTable.shared[indexPath.row]
        
        cell.textLabel?.text = function.name
        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
