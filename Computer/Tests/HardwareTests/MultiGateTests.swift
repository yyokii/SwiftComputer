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
            let a: Bit = .init(true)
            let b: Bit = .init(false)
            let c: Bit = .init(false)
            let d: Bit = .init(false)
            let sel: Bit2 = .init((.init(false), .init(false)))
            let result = MultiGate.mux4(a: a, b: b, c: c, d: d, sel: sel)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=1, c=0, d=0, sel=01") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(true)
            let c: Bit = .init(false)
            let d: Bit = .init(false)
            let sel: Bit2 = .init((.init(false), .init(true)))
            let result = MultiGate.mux4(a: a, b: b, c: c, d: d, sel: sel)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=0, c=1, d=0, sel=10") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(false)
            let c: Bit = .init(true)
            let d: Bit = .init(false)
            let sel: Bit2 = .init((.init(true), .init(false)))
            let result = MultiGate.mux4(a: a, b: b, c: c, d: d, sel: sel)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, b=0, c=0, d=1, sel=11") { _ in
            let a: Bit = .init(false)
            let b: Bit = .init(false)
            let c: Bit = .init(false)
            let d: Bit = .init(true)
            let sel: Bit2 = .init((.init(true), .init(true)))
            let result = MultiGate.mux4(a: a, b: b, c: c, d: d, sel: sel)
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testDmux4way() {
        XCTContext.runActivity(named: "a=0, sel=00") { _ in
            let a: Bit = .init(false)
            let sel: Bit2 = .init((.init(false), .init(false)))
            let result = MultiGate.dmux4way(a: a, sel: sel)
            let expectation: Bit4 = .init((.init(false), .init(false), .init(false), .init(false)))
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=00") { _ in
            let a: Bit = .init(true)
            let sel: Bit2 = .init((.init(false), .init(false)))
            let result = MultiGate.dmux4way(a: a, sel: sel)
            let expectation: Bit4 = .init((.init(true), .init(false), .init(false), .init(false)))
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, sel=01") { _ in
            let a: Bit = .init(false)
            let sel: Bit2 = .init((.init(false), .init(true)))
            let result = MultiGate.dmux4way(a: a, sel: sel)
            let expectation: Bit4 = .init((.init(false), .init(false), .init(false), .init(false)))
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=01") { _ in
            let a: Bit = .init(true)
            let sel: Bit2 = .init((.init(false), .init(true)))
            let result = MultiGate.dmux4way(a: a, sel: sel)
            let expectation: Bit4 = .init((.init(false), .init(true), .init(false), .init(false)))
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, sel=10") { _ in
            let a: Bit = .init(false)
            let sel: Bit2 = .init((.init(true), .init(false)))
            let result = MultiGate.dmux4way(a: a, sel: sel)
            let expectation: Bit4 = .init((.init(false), .init(false), .init(false), .init(false)))
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, sel=10") { _ in
            let a: Bit = .init(true)
            let sel: Bit2 = .init((.init(true), .init(false)))
            let result = MultiGate.dmux4way(a: a, sel: sel)
            let expectation: Bit4 = .init((.init(false), .init(false), a, .init(false)))
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=0, sel=11") { _ in
            let a: Bit = .init(false)
            let sel: Bit2 = .init((.init(true), .init(true)))
            let result = MultiGate.dmux4way(a: a, sel: sel)
            let expectation: Bit4 = .init((.init(false), .init(false), .init(false), .init(false)))
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=11") { _ in
            let a: Bit = .init(true)
            let sel: Bit2 = .init((.init(true), .init(true)))
            let result = MultiGate.dmux4way(a: a, sel: sel)
            let expectation: Bit4 = .init((.init(false), .init(false), .init(false), a))
                        
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testDmux8way() {
        XCTContext.runActivity(named: "a=1, sel=000") { _ in
            let a: Bit = .init(true)
            let sel: Bit3 = .init((.init(false), .init(false), .init(false)))
            let result = MultiGate.dmux8way(a: a, sel: sel)
            let expectation: Bit8 = .init((a, .init(false), .init(false), .init(false), .init(false), .init(false), .init(false), .init(false)))
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=001") { _ in
            let a: Bit = .init(true)
            let sel: Bit3 = .init((.init(false), .init(false), .init(true)))
            let result = MultiGate.dmux8way(a: a, sel: sel)
            let expectation: Bit8 = .init((.init(false), a, .init(false), .init(false), .init(false), .init(false), .init(false), .init(false)))
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=010") { _ in
            let a: Bit = .init(true)
            let sel: Bit3 = .init((.init(false), .init(true), .init(false)))
            let result = MultiGate.dmux8way(a: a, sel: sel)
            let expectation: Bit8 = .init((.init(false), .init(false), a, .init(false), .init(false), .init(false), .init(false), .init(false)))
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=011") { _ in
            let a: Bit = .init(true)
            let sel: Bit3 = .init((.init(false), .init(true), .init(true)))
            let result = MultiGate.dmux8way(a: a, sel: sel)
            let expectation: Bit8 = .init((.init(false), .init(false), .init(false), a, .init(false), .init(false), .init(false), .init(false)))
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=100") { _ in
            let a: Bit = .init(true)
            let sel: Bit3 = .init((.init(true), .init(false), .init(false)))
            let result = MultiGate.dmux8way(a: a, sel: sel)
            let expectation: Bit8 = .init((.init(false), .init(false), .init(false), .init(false), a, .init(false), .init(false), .init(false)))
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=101") { _ in
            let a: Bit = .init(true)
            let sel: Bit3 = .init((.init(true), .init(false), .init(true)))
            let result = MultiGate.dmux8way(a: a, sel: sel)
            let expectation: Bit8 = .init((.init(false), .init(false), .init(false), .init(false), .init(false), a, .init(false), .init(false)))
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=110") { _ in
            let a: Bit = .init(true)
            let sel: Bit3 = .init((.init(true), .init(true), .init(false)))
            let result = MultiGate.dmux8way(a: a, sel: sel)
            let expectation: Bit8 = .init((.init(false), .init(false), .init(false), .init(false), .init(false), .init(false), a, .init(false)))
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "a=1, sel=111") { _ in
            let a: Bit = .init(true)
            let sel: Bit3 = .init((.init(true), .init(true), .init(true)))
            let result = MultiGate.dmux8way(a: a, sel: sel)
            let expectation: Bit8 = .init((.init(false), .init(false), .init(false), .init(false), .init(false), .init(false), .init(false), a))
                        
            XCTAssertEqual(result, expectation)
        }
    }
}
