//
//  TaskManager.swift
//  RemindMe
//
//  Created by Yuchao CHEN on 7/6/19.
//  Copyright © 2019 Yuchao CHEN. All rights reserved.
//

import Foundation
import UIKit
import os.log

class TaskManager: NSObject {
    // MARK: Properties
    private var tasks: [Task] = []
    private var compeltedTask: [Task] = []
    
    var taskCount: Int { return tasks.count }
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("tasks")
    
    override init() {
        super.init()
        // when the app moves to the background, the tasks will be saved
        NotificationCenter.default.addObserver(self, selector: #selector(save), name: UIApplication.willResignActiveNotification, object: nil)
        // load the saved tasks
        if let items = NSArray(contentsOf: TaskManager.ArchiveURL) {
            for item in items {
                if let task = Task(dict: item as! [String:Any]) {
                    tasks.append(task)
                }
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        save()
    }
    
    func submitTask(_ t: Task) {
        tasks.append(t)
    }
    
    func task(at index: Int) -> Task {
        return tasks[index]
    }

    @objc func save() {
        // items to be saved
        let items = tasks.map{ $0.plist }
        guard items.count > 0 else {
            // if there is no item need to be saved, remove stored items
            try? FileManager.default.removeItem(at: TaskManager.ArchiveURL)
            return
        }
        do {
            let plist = try PropertyListSerialization.data(fromPropertyList: items, format: PropertyListSerialization.PropertyListFormat.xml, options: PropertyListSerialization.WriteOptions(0))
            try plist.write(to: TaskManager.ArchiveURL, options: Data.WritingOptions.atomic)
        } catch {
            print(error)
        }
    }
}
