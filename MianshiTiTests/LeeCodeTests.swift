//
//  LeeCodeTests.swift
//  MianshiTiTests
//
//  Created by app-01 on 2019/8/15.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import XCTest

class LeeCodeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func test66() -> Void {
        let s = Solution66()
        var r = s.plusOne([1,2,3])
        XCTAssertEqual([1,2,4], r)
        r = s.plusOne([4,3,2,1])
        XCTAssertEqual([4,3,2,2], r)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}