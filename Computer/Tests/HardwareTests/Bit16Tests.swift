//
//  Bit16Tests.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/03.
//

import XCTest
@testable import Hardware

final class Bit16Tests: XCTestCase {
    
    // 0001 0000 1000 0100
    private let testBit16_1: Bit16 = .init((Bit.init(false), Bit.init(false), Bit.init(true), Bit.init(false),
                                        Bit.init(false),Bit.init(false), Bit.init(false), Bit.init(true),
                                        Bit.init(false), Bit.init(false),Bit.init(false), Bit.init(false),
                                        Bit.init(true), Bit.init(false), Bit.init(false),Bit.init(false)))
    
    // 1000 0100 0010 0001
    private let testBit16_2: Bit16 = .init((Bit.init(true), Bit.init(false), Bit.init(false), Bit.init(false),
                                        Bit.init(false),Bit.init(true), Bit.init(false), Bit.init(false),
                                        Bit.init(false), Bit.init(false),Bit.init(true), Bit.init(false),
                                        Bit.init(false), Bit.init(false), Bit.init(false),Bit.init(true)))
    
    func testIsZero() {
        XCTContext.runActivity(named: "0000 0000 0000 0000") { _ in
            let result = Bit16.allZero.isZero
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "0001 0000 1000 0100") { _ in
            let result = testBit16_1.isZero
            let expectation: Bit = .init(false)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "1000 0100 0010 0001") { _ in
            let result = testBit16_2.isZero
            let expectation: Bit = .init(false)
                        
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testIsNegative() {
        XCTContext.runActivity(named: "0001 0000 1000 0100") { _ in
            let result = testBit16_1.isNegative
            let expectation: Bit = .init(false)
                        
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "1000 0100 0010 0001") { _ in
            let result = testBit16_2.isNegative
            let expectation: Bit = .init(true)
                        
            XCTAssertEqual(result, expectation)
        }
    }
}
