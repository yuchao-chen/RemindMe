//
//  LocationTests.swift
//  RemindMeTests
//
//  Created by Yuchao CHEN on 7/6/19.
//  Copyright © 2019 Yuchao CHEN. All rights reserved.
//

import XCTest
@testable import RemindMe
import CoreLocation

class LocationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateLocation() {
        let lat = 100.0
        let lon = 200.0
        let coordination = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let location = Location(coordinate: coordination)
        XCTAssertEqual(location.coordinate.latitude, lat)
        XCTAssertEqual(location.coordinate.longitude, lon)
    }
    
    func testLocationAreEqual() {
        let lat = 100.0
        let lon = 200.0
        let coordination = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let l0 = Location(coordinate: coordination)
        let l1 = Location(coordinate: coordination)
        XCTAssertEqual(l0, l1)
    }
    func testLocationAreNotEqual() {
        let l0 = Location(coordinate: CLLocationCoordinate2D(latitude: 0.1, longitude: 1))
        let l1 = Location(coordinate: CLLocationCoordinate2D(latitude: 0.2, longitude: 1))
        XCTAssertNotEqual(l0, l1)
    }
}
