//
//  MultiGateTests.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/02.
//

import XCTest
@testable import Hardware

final class MultiGateTests: XCTestCase {
    
    func testMux4() {
        XCTContext.runActivity(named: "a=1, b=0, c=0, d=0, sel=00") { _ in
            let a: Bool = true
            let b: Bool = false
            let c: Bool = false
            let d: Bool = false
            let sel: [Bool] = [false, false]
            let result = mux4(a: a, b: b, c: c, d: d, sel: sel)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=1, c=0, d=0, sel=01") { _ in
            let a: Bool = false
            let b: Bool = true
            let c: Bool = false
            let d: Bool = false
            let sel: [Bool] = [false, false]
            let result = mux4(a: a, b: b, c: c, d: d, sel: sel)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=0, c=1, d=0, sel=10") { _ in
            let a: Bool = false
            let b: Bool = false
            let c: Bool = true
            let d: Bool = false
            let sel: [Bool] = [false, false]
            let result = mux4(a: a, b: b, c: c, d: d, sel: sel)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=0, c=0, d=1, sel=11") { _ in
            let a: Bool = false
            let b: Bool = false
            let c: Bool = false
            let d: Bool = true
            let sel: [Bool] = [false, false]
            let result = mux4(a: a, b: b, c: c, d: d, sel: sel)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testDmux4way() {
        XCTContext.runActivity(named: "a=0, sel=00") { _ in
            let a: Bool = false
            let sel: [Bool] = [false, false]
            let result = dmux4way(a: a, sel: sel)
            let expectation: [Bool] = [false, false, false, false]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=00") { _ in
            let a: Bool = true
            let sel: [Bool] = [false, false]
            let result = dmux4way(a: a, sel: sel)
            let expectation: [Bool] = [true, false, false, false]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, sel=01") { _ in
            let a: Bool = false
            let sel: [Bool] = [false, true]
            let result = dmux4way(a: a, sel: sel)
            let expectation: [Bool] = [false, false, false, false]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=01") { _ in
            let a: Bool = true
            let sel: [Bool] = [false, true]
            let result = dmux4way(a: a, sel: sel)
            let expectation: [Bool] = [false, true, false, false]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, sel=10") { _ in
            let a: Bool = false
            let sel: [Bool] = [true, false]
            let result = dmux4way(a: a, sel: sel)
            let expectation: [Bool] = [false, false, false, false]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, sel=10") { _ in
            let a: Bool = true
            let sel: [Bool] = [true, false]
            let result = dmux4way(a: a, sel: sel)
            let expectation: [Bool] = [false, false, true, false]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, sel=11") { _ in
            let a: Bool = false
            let sel: [Bool] = [true, true]
            let result = dmux4way(a: a, sel: sel)
            let expectation: [Bool] = [false, false, false, false]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=11") { _ in
            let a: Bool = true
            let sel: [Bool] = [true, true]
            let result = dmux4way(a: a, sel: sel)
            let expectation: [Bool] = [false, false, false, true]
                        
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testDmux8way() {
        XCTContext.runActivity(named: "a=1, sel=000") { _ in
            let a: Bool = true
            let sel: [Bool] = [false, false, false]
            let result = dmux8way(a: a, sel: sel)
            let expectation: [Bool] = [a, false, false, false, false, false, false, false]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=001") { _ in
            let a: Bool = true
            let sel: [Bool] = [false, false, true]
            let result = dmux8way(a: a, sel: sel)
            let expectation: [Bool] = [false, a, false, false, false, false, false, false]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=010") { _ in
            let a: Bool = true
            let sel: [Bool] = [false, true, false]
            let result = dmux8way(a: a, sel: sel)
            let expectation: [Bool] = [false, false, a, false, false, false, false, false]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=011") { _ in
            let a: Bool = true
            let sel: [Bool] = [false, true, true]
            let result = dmux8way(a: a, sel: sel)
            let expectation: [Bool] = [false, false, false, a, false, false, false, false]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=100") { _ in
            let a: Bool = true
            let sel: [Bool] = [true, false, false]
            let result = dmux8way(a: a, sel: sel)
            let expectation: [Bool] = [false, false, false, false, a, false, false, false]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=101") { _ in
            let a: Bool = true
            let sel: [Bool] = [true, false, true]
            let result = dmux8way(a: a, sel: sel)
            let expectation: [Bool] = [false, false, false, false, false, a, false, false]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=110") { _ in
            let a: Bool = true
            let sel: [Bool] = [true, true, false]
            let result = dmux8way(a: a, sel: sel)
            let expectation: [Bool] = [false, false, false, false, false, false, a, false]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=111") { _ in
            let a: Bool = true
            let sel: [Bool] = [true, true, true]
            let result = dmux8way(a: a, sel: sel)
            let expectation: [Bool] = [false, false, false, false, false, false, false, a]
                        
            XCTAssertEqual(result, expectation)
        }
    }
}
