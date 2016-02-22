//
//  AnimalTest.swift
//  ZooKeeper
//
//  Created by Wayne Bangert on 2/10/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import XCTest
@testable import ZooKeeper

class AnimalTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_savingImage_updatesHasImage() {
        let image = UIImage(named: "camera")
        XCTAssertNotNil(image, "need an image")
        
        let animal = Duck(name: "peter", color: "blue", isMale: true)
        XCTAssert(animal.saveImage(image!), "saving should return true")
        XCTAssert(animal.hasImage(), "animal should have image")
        
        let loadedImage = animal.loadImage()
        XCTAssertNotNil(loadedImage, "animal image should load off disk")
    }
    
    func test_reportFunction_works() {
        let animal = Animal(type: "something", name: "nothing", color: "test", isMale: false)
        
        XCTAssertGreaterThan(animal.report().characters.count, 0, "Animal report should not be empty")
        
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
