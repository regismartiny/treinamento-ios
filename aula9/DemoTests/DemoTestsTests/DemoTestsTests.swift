//
//  DemoTestsTests.swift
//  DemoTestsTests
//
//  Created by InfraCWI on 12/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import XCTest
@testable import DemoTests

class DemoTestsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let text = "cwi"
        assert(text.addPoint() == "cwi.")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            let text = "cwi"
            assert(text.addPoint() == "cwi.")
        }
    }
    
}
