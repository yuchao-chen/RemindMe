//
//  BriefTaskTableViewCellTests.swift
//  RemindMeTests
//
//  Created by Yuchao CHEN on 7/6/19.
//  Copyright © 2019 Yuchao CHEN. All rights reserved.
//

import XCTest
@testable import RemindMe

class BriefTaskTableViewCellTests: XCTestCase {
    // MARK: Properties
    var cell: BriefTaskTableViewCell!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TaskTableViewController") as! TaskTableViewController
        viewController.loadViewIfNeeded()
        cell = viewController.taskTableView.dequeueReusableCell(withIdentifier: "BriefTaskTableViewCell", for: IndexPath(row: 0, section: 0)) as! BriefTaskTableViewCell
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testBriefTaskTableViewCellCreated() {
        XCTAssertNotNil(cell)
    }
    
}
