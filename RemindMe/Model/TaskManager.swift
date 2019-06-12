//
//  TaskManager.swift
//  RemindMe
//
//  Created by Yuchao CHEN on 7/6/19.
//  Copyright © 2019 Yuchao CHEN. All rights reserved.
//

import Foundation

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

}
