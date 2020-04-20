//
//  BrastlewarkCensusTests.swift
//  BrastlewarkCensusTests
//
//  Created by Jorge on 19/04/20.
//  Copyright © 2020 jorge. All rights reserved.
//

import XCTest
@testable import BrastlewarkCensus

class BrastlewarkCensusTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGnomeViewModel(){
        let gnome = Gnome(id: 0, name: "Test", thumbnail: "http://www.publicdomainpictures.net/pictures/10000/nahled/thinking-monkey-11282237747K8xB.jpg", age: 10, weight: 23.32, height: 50, hair_color: "Pink", professions: ["carpintero", "constructor"], friends: ["amigo1", "amigo2"])
        let gnomeViewModel = GnomeViewModel(gnome: gnome)
         
        XCTAssertEqual(gnome.name, gnomeViewModel.name)
        XCTAssertEqual(String(format: "%.2f", gnome.height), gnomeViewModel.height)
        XCTAssertEqual(String(format: "%.2f", gnome.weight), gnomeViewModel.weight)
        XCTAssertEqual(gnome.thumbnail, gnomeViewModel.thumbnailURL)
        XCTAssertEqual(String(gnome.age), gnomeViewModel.age)
        
        
    }

}
