//
//  TaskNewViewController.swift
//  RemindMe
//
//  Created by Yuchao CHEN on 13/6/19.
//  Copyright © 2019 Yuchao CHEN. All rights reserved.
//

import UIKit
import os.log

class TaskNewViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        
        // when the save button is triggered, configure destination view controller
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not triggered", log: OSLog.default, type: .debug)
            return
        }
        let title = titleTextField.text ?? ""
        
        task = Task(title: title)
    }
    

}
