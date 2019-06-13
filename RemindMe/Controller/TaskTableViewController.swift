//
//  TaskTableViewController.swift
//  RemindMe
//
//  Created by Yuchao CHEN on 7/6/19.
//  Copyright © 2019 Yuchao CHEN. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {

    // MARK: Properties
    @IBOutlet var taskTableView: UITableView!
    @IBOutlet weak var taskTitle: UILabel!
    let taskManager = TaskManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        loadSampleTask()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskManager.taskCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BriefTaskTableViewCell", for: indexPath) as? BriefTaskTableViewCell else {
            fatalError("The dequeued cell is not an instance of BriefTaskTableViewCell.")
        }

        // Configure the cell...
        let task = taskManager.task(at: indexPath.row)
        cell.taskTitle.text = task.title
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
        case "ShowDetail":
            // show the details of the selected task in a new page
            guard let selectedController = segue.destination as? TaskDetailsViewController else {
                fatalError("Unexpected segue destination: \(segue.destination)")
            }
            guard let selectedCell = sender as? BriefTaskTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            guard let indexPath = taskTableView.indexPath(for: selectedCell) else {
                fatalError("The selected cell is not displayed: \(sender)")
            }
            selectedController.task = taskManager.task(at: indexPath.row)
        case "NewTask":
            print("")
        default:
            fatalError("Unexpected segue identifier: \(segue.identifier)")
        }
    }
    
    // MARK: Private Methods
    private func loadSampleTask() {
        let l0 = Location(latitude: -37.891258, longitude: 145.174752, altitude: 1.0)
        let t0 = Task(title: "Foo", location: l0)
        taskManager.submitTask(t0)
        let l1 = Location(latitude: -39.891258, longitude: 143.174752, altitude: 1.0)
        let t1 = Task(title: "Bar", location: l1)
        taskManager.submitTask(t1)
    }
}
