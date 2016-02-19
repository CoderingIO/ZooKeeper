//
//  ZooDataTestCase.swift
//  ZooKeeper
//
//  Created by Wayne Bangert on 2/18/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import XCTest
@testable import ZooKeeper

class ZooDataTestCase: XCTestCase {
    
    
    func test_singleton_worksAndHasZoo() {
        let zoo = ZooData.sharedInstance.zoo
        XCTAssert(zoo.staff.count > 0, "zoo should have staff")
        XCTAssert(zoo.animals.count > 0, "zoo should have animals")
    }
    
    func test_singletin_isSameInstance() {
        let zoo = ZooData.sharedInstance.zoo
        let zoo2 = ZooData.sharedInstance.zoo
        XCTAssert(zoo === zoo2, "singleton should always return the same instances")
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
