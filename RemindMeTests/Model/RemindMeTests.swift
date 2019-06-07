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

    func testInitTaskTitle() {
        let task = Task(title: "Foo")
        XCTAssertEqual(task.title, "Foo", "task title should not be nill")
    }
    
    func testInitTaskTimestamp() {
        let timestamp = NSDate().timeIntervalSince1970
        let task = Task(title: "Foo")
        //let t = NSDate(timeIntervalSince1970: TimeInterval(task.timestamp ?? 0))
        XCTAssertTrue(abs(task.timestamp - timestamp) < 0.1)
    }
}
