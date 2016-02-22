//
//  ZooFactoryTestCase.swift
//  ZooKeeper
//
//  Created by Wayne Bangert on 2/18/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import XCTest
@testable import ZooKeeper


class ZooFactoryTestCase: XCTestCase {
    
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
    
    func test_saveZoo_works() {
        if let zoo = ZooFactory.zooFromJSONFileNamed("zoo") {
            let saved = ZooFactory.saveZoo(zoo, toFileNamed: "zoo")
            XCTAssert(saved, "should have saved zoo")
        } else {
            XCTFail("should have stuff in zoo")
        }
    }
    
    func test_loadSavedZoo_hasNewStuff () {
        if let zoo = ZooFactory.zooFromJSONFileNamed("zoo") {
            zoo.animals.append(Duck(name: "name", color: "color", isMale: true))
            let saved = ZooFactory.saveZoo(zoo, toFileNamed: "zoo2")
            XCTAssert(saved, "should have saved zoo")
            
            if let zoo2 = ZooFactory.zooFromJSONFileNamed("zoo2") {
                XCTAssert(zoo.animals.count == zoo2.animals.count, "new zoo should have a new animal")
            } else {
                XCTFail("new zoo should have loaded")
            }
        } else {
            XCTFail("should have stuff in zoo")
        }
    }
    
}
