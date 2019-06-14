//
//  Task.swift
//  RemindMe
//
//  Created by Yuchao CHEN on 7/6/19.
//  Copyright © 2019 Yuchao CHEN. All rights reserved.
//

import Foundation
import os.log

struct Task: Equatable {
    // MARK: Properties
    var title: String
    var notes: String?
    var timestamp: Double?
    var location: Location?
    
    // MARK: Types
    struct PropertyKey {
        static let title = "title"
        static let notes = "notes"
        static let timestamp = "timestamp"
        static let altitude = "altitude"
        static let latitude = "latitude"
        static let longitude = "longitude"
    }
    var plist: [String: Any] {
        var d = [String: Any]()
        d[PropertyKey.title] = title
        
        d[PropertyKey.notes] = notes
        d[PropertyKey.timestamp] = timestamp
        
        if let location = location {
            d[PropertyKey.latitude] = location.coordinate.latitude
            d[PropertyKey.longitude] = location.coordinate.longitude
            d[PropertyKey.altitude] = location.altitude
        }
        return d
    }
    // MARK: Initialization
    init(title: String, notes: String? = nil, timestamp: Double? = nil, location: Location? = nil) {
        self.title = title
        self.notes = notes
        // if timestamp is not given, timestamp is automatically generated
        self.timestamp = timestamp ?? NSDate().timeIntervalSince1970
        self.location = location
    }
    
    init?(dict: [String: Any]) {
        guard let title = dict[PropertyKey.title] as? String else { return nil }
        let notes = dict[PropertyKey.notes] as? String
        let timestamp = dict[PropertyKey.timestamp] as? Double
        let location: Location?
        if let lat = dict[PropertyKey.latitude] as? Double,
            let lon = dict[PropertyKey.longitude] as? Double,
            let alt = dict[PropertyKey.altitude] as? Double {
            location = Location(latitude: lat, longitude: lon, altitude: alt)
        } else {
            location = nil
        }
        self.title = title
        self.notes = notes
        self.timestamp = timestamp
        self.location = location
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
