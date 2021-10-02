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
            let a: Bit = .init(false)
            let b: Bit = .init(false)
            let result = Gate.nand(a: a, b: b)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=1") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(true)
            let result = Gate.nand(a: a, b: b)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=0") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(false)
            let result = Gate.nand(a: a, b: b)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=1") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(true)
            let result = Gate.nand(a: a, b: b)
            let expectation: Bit = .init(false)
                        
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testNot() {
        XCTContext.runActivity(named: "a=0") { _ in
            let a: Bit = .init(false)
            let result = Gate.not(a: a)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1") { _ in
            let a: Bit = .init(true)
            let result = Gate.not(a: a)
            let expectation: Bit = .init(false)
                        
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testAnd() {
        XCTContext.runActivity(named: "a=0, b=0") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(false)
            let result = Gate.and(a: a, b: b)
            let expectation: Bit = .init(false)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=1") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(true)
            let result = Gate.and(a: a, b: b)
            let expectation: Bit = .init(false)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=0") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(false)
            let result = Gate.and(a: a, b: b)
            let expectation: Bit = .init(false)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=1") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(true)
            let result = Gate.and(a: a, b: b)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testOr() {
        XCTContext.runActivity(named: "a=0, b=0") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(false)
            let result = Gate.or(a: a, b: b)
            let expectation: Bit = .init(false)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=1") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(true)
            let result = Gate.or(a: a, b: b)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=0") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(false)
            let result = Gate.or(a: a, b: b)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=1") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(true)
            let result = Gate.or(a: a, b: b)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testXor() {
        XCTContext.runActivity(named: "a=0, b=0") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(false)
            let result = Gate.xor(a: a, b: b)
            let expectation: Bit = .init(false)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=1") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(true)
            let result = Gate.xor(a: a, b: b)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=0") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(false)
            let result = Gate.xor(a: a, b: b)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=1") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(true)
            let result = Gate.xor(a: a, b: b)
            let expectation: Bit = .init(false)
                        
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testMux() {
        XCTContext.runActivity(named: "a=0, b=0, sel=0") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(false)
            let sel: Bit = .init(false)
            let result = Gate.mux(a: a, b: b, sel: sel)
            let expectation: Bit = .init(false)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=1, sel=0") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(true)
            let sel: Bit = .init(false)
            let result = Gate.mux(a: a, b: b, sel: sel)
            let expectation: Bit = .init(false)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=0, sel=0") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(false)
            let sel: Bit = .init(false)
            let result = Gate.mux(a: a, b: b, sel: sel)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=1, sel=0") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(true)
            let sel: Bit = .init(false)
            let result = Gate.mux(a: a, b: b, sel: sel)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=0, sel=1") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(false)
            let sel: Bit = .init(true)
            let result = Gate.mux(a: a, b: b, sel: sel)
            let expectation: Bit = .init(false)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=1, sel=1") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(true)
            let sel: Bit = .init(true)
            let result = Gate.mux(a: a, b: b, sel: sel)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=0, sel=1") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(false)
            let sel: Bit = .init(true)
            let result = Gate.mux(a: a, b: b, sel: sel)
            let expectation: Bit = .init(false)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=1, sel=1") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(true)
            let sel: Bit = .init(true)
            let result = Gate.mux(a: a, b: b, sel: sel)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testDmux() {
        XCTContext.runActivity(named: "a=0, sel=0") { _ in
            let a: Bit = .init(false)
            let sel: Bit = .init(false)
            let result = Gate.dmux(a: a, sel: sel)
            let expectation: [Bit] = [a, .init(false)]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, sel=1") { _ in
            let a: Bit = .init(false)
            let sel: Bit = .init(true)
            let result = Gate.dmux(a: a, sel: sel)
            let expectation: [Bit] = [.init(false), a]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=0") { _ in
            let a: Bit = .init(true)
            let sel: Bit = .init(false)
            let result = Gate.dmux(a: a, sel: sel)
            let expectation: [Bit] = [a, .init(false)]
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=1") { _ in
            let a: Bit = .init(true)
            let sel: Bit = .init(true)
            let result = Gate.dmux(a: a, sel: sel)
            let expectation: [Bit] = [.init(false), a]
                        
            XCTAssertEqual(result, expectation)
        }
    }
}

