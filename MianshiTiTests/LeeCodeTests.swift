//
//  LeeCodeTests.swift
//  MianshiTiTests
//
//  Created by app-01 on 2019/8/15.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

import XCTest

class LeeCodeTests: XCTestCase {
    
    var s:Solution66!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        s = Solution66()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        s = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func test66() -> Void {
        
        var r = s.plusOne([1,2,3])
        XCTAssertEqual([1,2,4], r)
        r = s.plusOne([4,3,2,1])
        XCTAssertEqual([4,3,2,2], r)
        r = s.plusOne([9])
        XCTAssertEqual([1,0], r)
        r = s.plusOne([9,9])
        XCTAssertEqual([1,0,0], r)
        r = s.plusOne([8,9,9,9])
        XCTAssertEqual([9,0,0,0], r)
    }
    
    func testSuperPow() -> Void {
        var r = s.superPow(2, [3])
        XCTAssertEqual(r, 8)
        r = s.superPow(2, [1,0])
        XCTAssertEqual(r, 1024)
        r = s.superPow(1, [4,3,8,5,2])
        XCTAssertEqual(1, r)
        r = s.superPow(2147483647, [2,0,0])
        r = s.superPow(78267, [1,7,7,4,3,1,7,0,1,4,4,9,2,8,5,0,0,9,3,1,2,5,9,6,0,9,9,0,9,6,0,5,3,7,9,8,8,9,8,2,5,4,1,9,3,8,0,5,9,5,6,1,1,8,9,3,7,8,5,8,5,5,3,0,4,3,1,5,4,1,7,9,6,8,8,9,8,0,6,7,8,3,1,1,1,0,6,8,1,1,6,6,9,1,8,5,6,9,0,0,1,7,1,7,7,2,8,5,4,4,5,2,9,6,5,0,8,1,0,9,5,8,7,6,0,6,1,8,7,2,9,8,1,0,7,9,4,7,6,9,2,3,1,3,9,9,6,8,0,8,9,7,7,7,3,9,5,5,7,4,9,8,3,0,1,2,1,5,0,8,4,4,3,8,9,3,7,5,3,9,4,4,9,3,3,2,4,8,9,3,3,8,2,8,1,3,2,2,8,4,2,5,0,6,3,0,9,0,5,4,1,1,8,0,4,2,5,8,2,4,2,7,5,4,7,6,9,0,8,9,6,1,4,7,7,9,7,8,1,4,4,3,6,4,5,2,6,0,1,1,5,3,8,0,9,8,8,0,0,6,1,6,9,6,5,8,7,4,8,9,9,2,4,7,7,9,9,5,2,2,6,9,7,7,9,8,5,9,8,5,5,0,3,5,8,9,5,7,3,4,6,4,6,2,3,5,2,3,1,4,5,9,3,3,6,4,1,3,3,2,0,0,4,4,7,2,3,3,9,8,7,8,5,5,0,8,3,4,1,4,0,9,5,5,4,4,9,7,7,4,1,8,7,5,2,4,9,7,9,1,7,8,9,2,4,1,1,7,6,4,3,6,5,0,2,1,4,3,9,2,0,0,2,9,8,4,5,7,3,5,8,2,3,9,5,9,1,8,8,9,2,3,7,0,4,1,1,8,7,0,2,7,3,4,6,1,0,3,8,5,8,9,8,4,8,3,5,1,1,4,2,5,9,0,5,3,1,7,4,8,9,6,7,2,3,5,5,3,9,6,9,9,5,7,3,5,2,9,9,5,5,1,0,6,3,8,0,5,5,6,5,6,4,5,1,7,0,6,3,9,4,4,9,1,3,4,7,7,5,8,2,0,9,2,7,3,0,9,0,7,7,7,4,1,2,5,1,3,3,6,4,8,2,5,9,5,0,8,2,5,6,4,8,8,8,7,3,1,8,5,0,5,2,4,8,5,1,1,0,7,9,6,5,1,2,6,6,4,7,0,9,5,6,9,3,7,8,8,8,6,5,8,3,8,5,4,5,8,5,7,5,7,3,2,8,7,1,7,1,8,7,3,3,6,2,9,3,3,9,3,1,5,1,5,5,8,1,2,7,8,9,2,5,4,5,4,2,6,1,3,6,0,6,9,6,1,0,1,4,0,4,5,5,8,2,2,6,3,4,3,4,3,8,9,7,5,5,9,1,8,5,9,9,1,8,7,2,1,1,8,1,5,6,8,5,8,0,2,4,4,7,8,9,5,9,8,0,5,0,3,5,5,2,6,8,3,4,1,4,7,1,7,2,7,5,8,8,7,2,2,3,9,2,2,7,3,2,9,0,2,3,6,9,7,2,8,0,8,1,6,5,2,3,0,2,0,0,0,9,2,2,2,3,6,6,0,9,1,0,0,3,5,8,3,2,0,3,5,1,4,1,6,8,7,6,0,9,8,0,1,0,4,5,6,0,2,8,2,5,0,2,8,5,2,3,0,2,6,7,3,0,0,2,1,9,0,1,9,9,2,0,1,6,7,7,9,9,6,1,4,8,5,5,6,7,0,6,1,7,3,5,9,3,9,0,5,9,2,4,8,6,6,2,2,3,9,3,5,7,4,1,6,9,8,2,6,9,0,0,8,5,7,7,0,6,0,5,7,4,9,6,0,7,8,4,3,9,8,8,7,4,1,5,6,0,9,4,1,9,4,9,4,1,8,6,7,8,2,5,2,3,3,4,3,3,1,6,4,1,6,1,5,7,8,1,9,7,6,0,8,0,1,4,4,0,1,1,8,3,8,3,8,3,9,1,6,0,7,1,3,3,4,9,3,5,2,4,2,0,7,3,3,8,7,7,8,8,0,9,3,1,2,2,4,3,3,3,6,1,6,9,6,2,0,1,7,5,6,2,5,3,5,0,3,2,7,2,3,0,3,6,1,7,8,7,0,4,0,6,7,6,6,3,9,8,5,8,3,3,0,9,6,7,1,9,2,1,3,5,1,6,3,4,3,4,1,6,8,4,2,5])
    }
    
    func testMypow() -> Void {
        var r = s.myPow(2, 10)
        XCTAssertEqual(1024.0, r)
        r = s.myPow(2.1, 3)
        XCTAssertEqual(9.26100, r, accuracy: 0.0001)
        r = s.myPow(2.0, -2)
        XCTAssertEqual(0.25, r)
    }
    
    func testMod() {
        XCTAssertEqual(-3, -7%4)
    }
    
    func testEnum() {
        for i in 0...3 {
            print(i)
        }
    }
    
//    func testDouble() -> Void {
//        var n:Double = 44.0
//        while n>0 {
//            print(n)
//            n = n >> 1
//        }
//    }
    
    func testFindSubsequences() {
        var r = s.findSubsequences491([4,6])
        XCTAssertEqual([[4,6]], r)
        r = s.findSubsequences491([1,2,3,4,5,6,7,8,9,10,1,1,1,1,1])
        r = s.findSubsequences491([4,6,7,7])
        XCTAssertEqual([[4, 6], [4, 7], [4, 6, 7], [4, 6, 7, 7], [6, 7], [6, 7, 7], [7,7], [4,7,7]].count, r.count)
        r = s.findSubsequences491([4,3,2,1])
        XCTAssertEqual([], r)
        r = s.findSubsequences491([])
        XCTAssertEqual([], r)
    }
    
    func test842() {
        var r = s.splitIntoFibonacci842("2820022842865610841740282445647388119521934031292")
        XCTAssertEqual(r, [28,200,228,428,656,1084,1740,2824,4564,7388,11952,19340,31292])
        r = s.splitIntoFibonacci842("74912134825162255812723932620170946950766784234934")
        r = s.splitIntoFibonacci842("123456579")
        XCTAssertEqual(r, [123,456,579])
        r = s.splitIntoFibonacci842("0123")
        XCTAssertEqual(r, [])
        r = s.splitIntoFibonacci842("11235813")
        XCTAssertEqual(r, [1,1,2,3,5,8,13])
        r = s.splitIntoFibonacci842("112358130")
        XCTAssertEqual(r, [])
        r =  s.splitIntoFibonacci842("214748364721474836422147483641")
    }
    
    func test662() {
        let n1 = TreeNode(1)
        n1.left = TreeNode(3)
        n1.right = TreeNode(2)
        n1.left!.left = TreeNode(5)
        n1.left!.right = TreeNode(3)
        n1.right!.right = TreeNode(9)
        let r = s.widthOfBinaryTree662(n1)
        XCTAssertEqual(4, r)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
