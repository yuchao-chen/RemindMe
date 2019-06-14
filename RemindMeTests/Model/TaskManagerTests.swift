//
//  TaskManagerTests.swift
//  RemindMeTests
//
//  Created by Yuchao CHEN on 7/6/19.
//  Copyright © 2019 Yuchao CHEN. All rights reserved.
//

import XCTest
@testable import RemindMe

class TaskManagerTests: XCTestCase {

    // MARK: Properties
    var sut: TaskManager!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = TaskManager()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
//    func testTaskCount() {
//        XCTAssertEqual(sut.taskCount, 0)
////        let task = Task("Foo")
////        sut.submitTask(task)
////        XCTAssertEqual(sut.taskCount(), 1)
//    }
    
    func testSubmitTask() {
        let count = sut.taskCount
        let task = Task(title: "Foo")
        sut.submitTask(task)
        XCTAssertEqual(sut.taskCount, count + 1)
    }

    func testReturnedTask() {
        let task = Task(title: "Foo")
        sut.submitTask(task)
        let count = sut.taskCount
        XCTAssertEqual(sut.task(at: count - 1), task)
    }
}
