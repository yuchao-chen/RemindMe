//
//  RemindMeTests.swift
//  RemindMeTests
//
//  Created by Yuchao CHEN on 7/6/19.
//  Copyright © 2019 Yuchao CHEN. All rights reserved.
//

import XCTest
@testable import RemindMe

class RemindMeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitCreateTaskWithTitle() {
        let title = "Foo"
        let task = Task(title: title)
        XCTAssertEqual(task.title, title, "task title is not same")
    }
    
    func testInitTaskTimestamp() {
        let title = "Foo"
        let timestamp = 0.1
        let task = Task(title: title, timestamp: timestamp)
        XCTAssertEqual(task.timestamp, timestamp, "task timestamp is not same")
    }
    
    func testCompareTaskIsNotEqual() {
        let t0 = Task(title: "Foo")
        let t1 = Task(title: "Bar")
        XCTAssertNotEqual(t0, t1)
    }
    
    func testCompareTaskEqual() {
        let t0 = Task(title: "Foo")
        let t1 = Task(title: "Foo")
        XCTAssertEqual(t0, t1)
    }
}
