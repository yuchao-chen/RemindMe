//
//  Location.swift
//  RemindMe
//
//  Created by Yuchao CHEN on 7/6/19.
//  Copyright © 2019 Yuchao CHEN. All rights reserved.
//

import Foundation
import CoreLocation

struct Location: Equatable {
    // MARK: Properties
    let coordinate: CLLocationCoordinate2D
    let altitude: CLLocationDistance
    
    // MARK: Initialization
    init(coordinate: CLLocationCoordinate2D, altitude: CLLocationDistance) {
        self.coordinate = coordinate
        self.altitude = altitude
    }
    
    init(latitude: Double, longitude: Double, altitude: Double) {
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.altitude = CLLocationDistance(altitude)
    }
    // MARK: Equatable
    public static func == (l: Location, r: Location) -> Bool {
        if l.coordinate.latitude != r.coordinate.latitude ||
           l.coordinate.longitude != r.coordinate.longitude ||
           l.altitude != r.altitude {
            return false
        }
        return true
    }
}
