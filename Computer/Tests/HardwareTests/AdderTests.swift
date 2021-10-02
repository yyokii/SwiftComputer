//
//  AdderTests.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/02.
//

import XCTest
@testable import Hardware

// https://stackoverflow.com/questions/26181221/how-to-convert-a-decimal-number-to-binary-in-swift
#warning("Add add16 and inc16 tests")

final class AdderTests: XCTestCase {
    
    func testHalfAdder() {
        XCTContext.runActivity(named: "a=0, b=0") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(false)
            let result = Adder.halfAdder(a: a, b: b)
            let expectation: AdderOutput = .init(sum: .init(false), carry: .init(false))
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=1") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(true)
            let result = Adder.halfAdder(a: a, b: b)
            let expectation: AdderOutput = .init(sum: .init(true), carry: .init(false))
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=0") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(false)
            let result = Adder.halfAdder(a: a, b: b)
            let expectation: AdderOutput = .init(sum: .init(true), carry: .init(false))
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=1") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(true)
            let result = Adder.halfAdder(a: a, b: b)
            let expectation: AdderOutput = .init(sum: .init(false), carry: .init(true))
            
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testFullAdder() {
        XCTContext.runActivity(named: "a=0, b=0, c=0") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(false)
            let c: Bit = .init(false)
            let result = Adder.fullAdder(a: a, b: b, c: c)
            let expectation: AdderOutput = .init(sum: .init(false), carry: .init(false))
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=0, c=1") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(false)
            let c: Bit = .init(true)
            let result = Adder.fullAdder(a: a, b: b, c: c)
            let expectation: AdderOutput = .init(sum: .init(true), carry: .init(false))
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=1, c=0") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(true)
            let c: Bit = .init(false)
            let result = Adder.fullAdder(a: a, b: b, c: c)
            let expectation: AdderOutput = .init(sum: .init(true), carry: .init(false))
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=1, c=1") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(true)
            let c: Bit = .init(true)
            let result = Adder.fullAdder(a: a, b: b, c: c)
            let expectation: AdderOutput = .init(sum: .init(false), carry: .init(true))
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=0, c=0") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(false)
            let c: Bit = .init(false)
            let result = Adder.fullAdder(a: a, b: b, c: c)
            let expectation: AdderOutput = .init(sum: .init(true), carry: .init(false))
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=0, c=1") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(false)
            let c: Bit = .init(true)
            let result = Adder.fullAdder(a: a, b: b, c: c)
            let expectation: AdderOutput = .init(sum: .init(false), carry: .init(true))
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=1, c=0") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(true)
            let c: Bit = .init(false)
            let result = Adder.fullAdder(a: a, b: b, c: c)
            let expectation: AdderOutput = .init(sum: .init(false), carry: .init(true))
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, b=1, c=1") { _ in
            let a: Bit = .init(true)
            let b: Bit = .init(true)
            let c: Bit = .init(true)
            let result = Adder.fullAdder(a: a, b: b, c: c)
            let expectation: AdderOutput = .init(sum: .init(true), carry: .init(true))
            
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testAdd16() {
        XCTContext.runActivity(named: "a=0, b=0, c=0") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(false)
            let c: Bit = .init(false)
            let result = Adder.fullAdder(a: a, b: b, c: c)
            let expectation: AdderOutput = .init(sum: .init(false), carry: .init(false))
            
            XCTAssertEqual(result, expectation)
        }
    }
}
