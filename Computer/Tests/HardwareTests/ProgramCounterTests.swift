//
//  ProgramCounterTests.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/05.
//

import XCTest
@testable import Hardware

final class ProgramCounterTests: XCTestCase {
    
    func testProgramCounter() {
        
        let `in`: Bit16 = .init((.random(), .random(), .random(), .random(),
                                 .random(), .random(), .random(), .random(),
                                 .random(), .random(), .random(), .random(),
                                 .random(), .random(), .random(), .random()))
        
        
        XCTContext.runActivity(named: "reset=0, load=0, inc=0") { _ in
            var pc: ProgramCounter = ProgramCounter()
            let reset: Bit = .init(false)
            let load: Bit = .init(false)
            let inc: Bit = .init(false)
            
            _          = pc.output(in: `in`, inc: inc, load: load, reset: reset)
            let result = pc.output(in: .allZero, inc: .init(false), load: .init(false), reset: .init(false))
            let expectation: Bit16 = .allZero
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "reset=0, load=0, inc=1") { _ in
            var pc: ProgramCounter = ProgramCounter()
            let reset: Bit = .init(false)
            let load: Bit = .init(false)
            let inc: Bit = .init(true)
            
            _          = pc.output(in: `in`, inc: inc, load: load, reset: reset)
            let result = pc.output(in: .allZero, inc: .init(false), load: .init(false), reset: .init(false))
            let expectation: Bit16 = .one
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "reset=0, load=1, inc=0") { _ in
            var pc: ProgramCounter = ProgramCounter()
            let reset: Bit = .init(false)
            let load: Bit = .init(true)
            let inc: Bit = .init(false)
            
            _          = pc.output(in: `in`, inc: inc, load: load, reset: reset)
            let result = pc.output(in: .allZero, inc: .init(false), load: .init(false), reset: .init(false))
            let expectation: Bit16 = `in`
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "reset=0, load=1, inc=1") { _ in
            var pc: ProgramCounter = ProgramCounter()
            let reset: Bit = .init(false)
            let load: Bit = .init(true)
            let inc: Bit = .init(true)
            
            _          = pc.output(in: `in`, inc: inc, load: load, reset: reset)
            let result = pc.output(in: .allZero, inc: .init(false), load: .init(false), reset: .init(false))
            let expectation: Bit16 = `in`
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "reset=1, load=0, inc=0") { _ in
            var pc: ProgramCounter = ProgramCounter()
            let reset: Bit = .init(true)
            let load: Bit = .init(false)
            let inc: Bit = .init(false)
            
            _          = pc.output(in: `in`, inc: inc, load: load, reset: reset)
            let result = pc.output(in: .allZero, inc: .init(false), load: .init(false), reset: .init(false))
            let expectation: Bit16 = .allZero
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "reset=1, load=0, inc=1") { _ in
            var pc: ProgramCounter = ProgramCounter()
            let reset: Bit = .init(true)
            let load: Bit = .init(false)
            let inc: Bit = .init(true)
            
            _          = pc.output(in: `in`, inc: inc, load: load, reset: reset)
            let result = pc.output(in: .allZero, inc: .init(false), load: .init(false), reset: .init(false))
            let expectation: Bit16 = .allZero
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "reset=1, load=1, inc=0") { _ in
            var pc: ProgramCounter = ProgramCounter()
            let reset: Bit = .init(true)
            let load: Bit = .init(true)
            let inc: Bit = .init(false)
            
            _          = pc.output(in: `in`, inc: inc, load: load, reset: reset)
            let result = pc.output(in: .allZero, inc: .init(false), load: .init(false), reset: .init(false))
            let expectation: Bit16 = .allZero
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "reset=1, load=1, inc=") { _ in
            var pc: ProgramCounter = ProgramCounter()
            let reset: Bit = .init(true)
            let load: Bit = .init(true)
            let inc: Bit = .init(true)
            
            _          = pc.output(in: `in`, inc: inc, load: load, reset: reset)
            let result = pc.output(in: .allZero, inc: .init(false), load: .init(false), reset: .init(false))
            let expectation: Bit16 = .allZero
            
            XCTAssertEqual(result, expectation)
        }
    }
}
