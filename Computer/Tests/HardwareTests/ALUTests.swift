//
//  ALUTests.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/03.
//

import XCTest
@testable import Hardware

final class ALUTests: XCTestCase {
    
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
    
    func testZero() {
        XCTContext.runActivity(named: "input: 0001 0000 1000 0100, control: 0") { _ in
            let input: Bit16 = testBit16_1
            let control: Bit = .init(false)
            let result = ALU.zero(input, control: control)
            let expectation: Bit16 = input
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "input: 0001 0000 1000 0100, control: 1") { _ in
            let input: Bit16 = testBit16_1
            let control: Bit = .init(true)
            let result = ALU.zero(input, control: control)
            let expectation: Bit16 = Bit16.allZero
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "input: 1000 0100 0010 0001, control: 0") { _ in
            let input: Bit16 = testBit16_2
            let control: Bit = .init(false)
            let result = ALU.zero(input, control: control)
            let expectation: Bit16 = input
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "input: 1000 0100 0010 0001, control: 1") { _ in
            let input: Bit16 = testBit16_2
            let control: Bit = .init(true)
            let result = ALU.zero(input, control: control)
            let expectation: Bit16 = Bit16.allZero
            
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testNegate() {
        XCTContext.runActivity(named: "input: 0001 0000 1000 0100, control: 0") { _ in
            let input: Bit16 = testBit16_1
            let control: Bit = .init(false)
            let result = ALU.negate(input, control: control)
            let expectation: Bit16 = input
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "input: 0001 0000 1000 0100, control: 1") { _ in
            let input: Bit16 = testBit16_1
            let control: Bit = .init(true)
            let result = ALU.negate(input, control: control)
            let expectation: Bit16 = .init((Bit.init(true), Bit.init(true), Bit.init(false), Bit.init(true),
                                            Bit.init(true),Bit.init(true), Bit.init(true), Bit.init(false),
                                            Bit.init(true), Bit.init(true),Bit.init(true), Bit.init(true),
                                            Bit.init(false), Bit.init(true), Bit.init(true),Bit.init(true)))
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "input: 1000 0100 0010 0001, control: 0") { _ in
            let input: Bit16 = testBit16_2
            let control: Bit = .init(false)
            let result = ALU.negate(input, control: control)
            let expectation: Bit16 = input
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "input: 1000 0100 0010 0001, control: 1") { _ in
            let input: Bit16 = testBit16_2
            let control: Bit = .init(true)
            let result = ALU.negate(input, control: control)
            let expectation: Bit16 = .init((Bit.init(false), Bit.init(true), Bit.init(true), Bit.init(true),
                                            Bit.init(true),Bit.init(false), Bit.init(true), Bit.init(true),
                                            Bit.init(true), Bit.init(true),Bit.init(false), Bit.init(true),
                                            Bit.init(true), Bit.init(true), Bit.init(true),Bit.init(false)))
            
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testALU() {
        XCTContext.runActivity(named: "x: 0001 0000 1000 0100, y: 1000 0100 0010 0001, zx: 0, nx: 0, zy: 0, ny: 0, f: 0, no: 0") { _ in
            let x: Bit16 = testBit16_1
            let y: Bit16 = testBit16_2
            let zx: Bit = .init(false)
            let nx: Bit = .init(false)
            let zy: Bit = .init(false)
            let ny: Bit = .init(false)
            let f: Bit = .init(false)
            let no: Bit = .init(false)
            let result = ALU.alu(x: x, y: y, zx: zx, nx: nx, zy: zy, ny: ny, f: f, no: no)
            let expectationBit: Bit16 = .init((Bit.init(false), Bit.init(false), Bit.init(false), Bit.init(false),
                                               Bit.init(false),Bit.init(false), Bit.init(false), Bit.init(false),
                                               Bit.init(false), Bit.init(false),Bit.init(false), Bit.init(false),
                                               Bit.init(false), Bit.init(false), Bit.init(false),Bit.init(false)))
            let expectation: ALUOutput = .init(out: expectationBit, zr: .init(true), ng: .init(false))
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "x: 0001 0000 1000 0100, y: 1000 0100 0010 0001, zx: 0, nx: 0, zy: 0, ny: 0, f: 1, no: 1") { _ in
            let x: Bit16 = testBit16_1
            let y: Bit16 = testBit16_2
            let zx: Bit = .init(false)
            let nx: Bit = .init(false)
            let zy: Bit = .init(false)
            let ny: Bit = .init(false)
            let f: Bit = .init(true)
            let no: Bit = .init(true)
            let result = ALU.alu(x: x, y: y, zx: zx, nx: nx, zy: zy, ny: ny, f: f, no: no)
            let expectationBit: Bit16 = .init((Bit.init(false), Bit.init(true), Bit.init(false), Bit.init(true),
                                               Bit.init(true),Bit.init(false), Bit.init(true), Bit.init(false),
                                               Bit.init(true), Bit.init(true),Bit.init(false), Bit.init(true),
                                               Bit.init(false), Bit.init(true), Bit.init(true),Bit.init(false)))
            let expectation: ALUOutput = .init(out: expectationBit, zr: .init(false), ng: .init(false))
            
            XCTAssertEqual(result, expectation)
        }
    }
}
