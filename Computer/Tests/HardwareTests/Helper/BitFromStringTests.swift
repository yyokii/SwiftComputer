//
//  BitFromStringTests.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/31.
//

import XCTest
@testable import Hardware

final class BitFromStringTests: XCTestCase {
    
    func testBit16() {
        XCTContext.runActivity(named: "text: 0011 0000 0011 1001") { _ in
            let result: Bit16 = .make(from: "0011000000111001")
            let expectation: Bit16 = .init((.init(true), .init(false), .init(false), .init(true),
                                            .init(true), .init(true), .init(false), .init(false),
                                            .init(false), .init(false), .init(false), .init(false),
                                            .init(true), .init(true), .init(false), .init(false)))
            
            XCTAssertEqual(result, expectation)
        }
    }
}
