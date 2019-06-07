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
    // MARK: Initialization
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    // MARK: Equatable
    public static func == (l: Location, r: Location) -> Bool {
        if l.coordinate.latitude != r.coordinate.latitude ||
            l.coordinate.longitude != r.coordinate.longitude {
            return false
        }
        return true
    }
}
