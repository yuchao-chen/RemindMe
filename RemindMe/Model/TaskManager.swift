//
//  TaskManager.swift
//  RemindMe
//
//  Created by Yuchao CHEN on 7/6/19.
//  Copyright © 2019 Yuchao CHEN. All rights reserved.
//

import Foundation
import os.log

class TaskManager {
    // MARK: Properties
    private var tasks: [Task] = []
    private var compeltedTask: [Task] = []
    
    var taskCount: Int { return tasks.count }
    
    func submitTask(_ t: Task) {
        tasks.append(t)
    }
    
    func task(at index: Int) -> Task {
        return tasks[index]
    }

    func save() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(tasks, toFile: Task.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Tasks successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save tasks.", log: OSLog.default, type: .debug)
        }
    }
    
    func load() {
        if let savedTasks = NSKeyedUnarchiver.unarchiveObject(withFile: Task.ArchiveURL.path) as? [Task] {
            tasks += savedTasks
        }
    }
}
