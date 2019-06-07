//
//  Task.swift
//  RemindMe
//
//  Created by Yuchao CHEN on 7/6/19.
//  Copyright © 2019 Yuchao CHEN. All rights reserved.
//

import Foundation

struct Task: Equatable {
    // MARK: Properties
    let title: String
    let description: String?
    let timestamp: Double?
    let location: Location?
    // MARK: Initialization
    init(title: String, description: String? = nil, timestamp: Double? = nil, location: Location? = nil) {
        self.title = title
        self.description = description
        // if timestamp is not given, timestamp is automatically generated
        self.timestamp = timestamp//NSDate().timeIntervalSince1970
        self.location = location
    }
    // MARK: Equatable
    public static func == (l: Task, r: Task) -> Bool {
        if l.title != r.title {
            return false
        }
        if l.description != r.description {
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
