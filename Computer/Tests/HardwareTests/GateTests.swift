//
//  GateTests.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/01.
//

import XCTest
@testable import Hardware

final class GateTests: XCTestCase {
    
    func testNand() {
        XCTContext.runActivity(named: "a=0, b=0") { _ in
            let a: Bool = false
            let b: Bool = false
            let result = nand(a: a, b: b)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=1") { _ in
            let a: Bool = false
            let b: Bool = true
            let result = nand(a: a, b: b)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=0") { _ in
            let a: Bool = true
            let b: Bool = false
            let result = nand(a: a, b: b)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=1") { _ in
            let a: Bool = true
            let b: Bool = true
            let result = nand(a: a, b: b)
            let expectation: Bool = false
                        
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testNot() {
        XCTContext.runActivity(named: "a=0") { _ in
            let a: Bool = false
            let result = not(a: a)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1") { _ in
            let a: Bool = true
            let result = not(a: a)
            let expectation: Bool = false
                        
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testAnd() {
        XCTContext.runActivity(named: "a=0, b=0") { _ in
            let a: Bool = false
            let b: Bool = false
            let result = and(a: a, b: b)
            let expectation: Bool = false
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=1") { _ in
            let a: Bool = false
            let b: Bool = true
            let result = and(a: a, b: b)
            let expectation: Bool = false
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=0") { _ in
            let a: Bool = true
            let b: Bool = false
            let result = and(a: a, b: b)
            let expectation: Bool = false
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=1") { _ in
            let a: Bool = true
            let b: Bool = true
            let result = and(a: a, b: b)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testOr() {
        XCTContext.runActivity(named: "a=0, b=0") { _ in
            let a: Bool = false
            let b: Bool = false
            let result = or(a: a, b: b)
            let expectation: Bool = false
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=1") { _ in
            let a: Bool = false
            let b: Bool = true
            let result = or(a: a, b: b)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=0") { _ in
            let a: Bool = true
            let b: Bool = false
            let result = or(a: a, b: b)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=1") { _ in
            let a: Bool = true
            let b: Bool = true
            let result = or(a: a, b: b)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testXor() {
        XCTContext.runActivity(named: "a=0, b=0") { _ in
            let a: Bool = false
            let b: Bool = false
            let result = xor(a: a, b: b)
            let expectation: Bool = false
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=1") { _ in
            let a: Bool = false
            let b: Bool = true
            let result = xor(a: a, b: b)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=0") { _ in
            let a: Bool = true
            let b: Bool = false
            let result = xor(a: a, b: b)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=1") { _ in
            let a: Bool = true
            let b: Bool = true
            let result = xor(a: a, b: b)
            let expectation: Bool = false
                        
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testMux() {
        XCTContext.runActivity(named: "a=0, b=0, sel=0") { _ in
            let a: Bool = false
            let b: Bool = false
            let sel: Bool = false
            let result = mux(a: a, b: b, sel: sel)
            let expectation: Bool = false
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=1, sel=0") { _ in
            let a: Bool = false
            let b: Bool = true
            let sel: Bool = false
            let result = mux(a: a, b: b, sel: sel)
            let expectation: Bool = false
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=0, sel=0") { _ in
            let a: Bool = true
            let b: Bool = false
            let sel: Bool = false
            let result = mux(a: a, b: b, sel: sel)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=1, sel=0") { _ in
            let a: Bool = true
            let b: Bool = true
            let sel: Bool = false
            let result = mux(a: a, b: b, sel: sel)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=0, sel=1") { _ in
            let a: Bool = false
            let b: Bool = false
            let sel: Bool = true
            let result = mux(a: a, b: b, sel: sel)
            let expectation: Bool = false
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=1, sel=1") { _ in
            let a: Bool = false
            let b: Bool = true
            let sel: Bool = true
            let result = mux(a: a, b: b, sel: sel)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=0, sel=1") { _ in
            let a: Bool = true
            let b: Bool = false
            let sel: Bool = true
            let result = mux(a: a, b: b, sel: sel)
            let expectation: Bool = false
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=1, sel=1") { _ in
            let a: Bool = true
            let b: Bool = true
            let sel: Bool = true
            let result = mux(a: a, b: b, sel: sel)
            let expectation: Bool = true
                        
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testDmux() {
        XCTContext.runActivity(named: "a=0, sel=0") { _ in
            let a: Bool = false
            let sel: Bool = false
            let result = dmux(a: a, sel: sel)
            let expectation: [Bool] = [a, false]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, sel=1") { _ in
            let a: Bool = false
            let sel: Bool = true
            let result = dmux(a: a, sel: sel)
            let expectation: [Bool] = [false, a]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=0") { _ in
            let a: Bool = true
            let sel: Bool = false
            let result = dmux(a: a, sel: sel)
            let expectation: [Bool] = [a, false]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=1") { _ in
            let a: Bool = true
            let sel: Bool = true
            let result = dmux(a: a, sel: sel)
            let expectation: [Bool] = [false, a]
                        
            XCTAssertEqual(result, expectation)
        }
    }
}

