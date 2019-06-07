//
//  Task.swift
//  RemindMe
//
//  Created by Yuchao CHEN on 7/6/19.
//  Copyright © 2019 Yuchao CHEN. All rights reserved.
//

import Foundation

class Task {
    let title: String
    let description: String?
    let timestamp: Double
    let location: Location?
    
    init(title: String, description: String? = nil, timestamp: Double? = nil, location: Location? = nil) {
        self.title = title
        self.description = description
        // if timestamp is not given, timestamp is automatically generated
        self.timestamp = NSDate().timeIntervalSince1970
        self.location = location
    }
}
