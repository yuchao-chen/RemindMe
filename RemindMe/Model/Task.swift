//
//  Task.swift
//  RemindMe
//
//  Created by Yuchao CHEN on 7/6/19.
//  Copyright © 2019 Yuchao CHEN. All rights reserved.
//

import Foundation
import os.log

class Task: NSObject, NSCoding {
    // MARK: Properties
    var title: String
    var notes: String?
    var timestamp: Double?
    var location: Location?
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("tasks")
    
    // MARK: Types
    struct PropertyKey {
        static let title = "title"
        static let notes = "description"
        static let timestamp = "timestamp"
    }
    
    // MARK: Initialization
    init(title: String, description: String? = nil, timestamp: Double? = nil, location: Location? = nil) {
        self.title = title
        self.notes = description
        // if timestamp is not given, timestamp is automatically generated
        self.timestamp = timestamp ?? NSDate().timeIntervalSince1970
        self.location = location
    }
    
    // MARK: NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(title, forKey: PropertyKey.title)
        coder.encode(notes, forKey: PropertyKey.notes)
        coder.encode(timestamp, forKey: PropertyKey.timestamp)
    }
    
    required convenience init?(coder: NSCoder) {
        // the title is required
        guard let title = coder.decodeObject(forKey: PropertyKey.title) as? String else {
            os_log("Unable to decode the name for a Task object.", log: OSLog.default, type: .debug)
            return nil
        }
        let description = coder.decodeObject(forKey: PropertyKey.notes) as? String
        let timestamp = coder.decodeDouble(forKey: PropertyKey.timestamp)
        self.init(title: title, description: description, timestamp: timestamp)
    }
    
    // MARK: Equatable
    public static func == (l: Task, r: Task) -> Bool {
        if l.title != r.title {
            return false
        }
        if l.notes != r.notes {
            return false
        }
        if l.timestamp != r.timestamp {
            return false
        }
        if l.location != r.location {
            return false;
        }
        return true
    }
}
