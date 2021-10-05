//
//  RegisterTests.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/04.
//

import XCTest
@testable import Hardware

final class RegisterTests: XCTestCase {
    
    func testRegister_WhenPreOutAndInputIsZero() {
        
        let dffGate = DFF(Bit.init(false))
        
        XCTContext.runActivity(named: "in=0, load=0, out(t-1)=0, in(t-1)=0") { _ in
            let `in`: Bit = .init(false)
            let load: Bit = .init(false)
            var register = Register()
            register.dffGate = dffGate
            let result = register.output(in: `in`, load: load)
            let expectation: Bit = .init(false)
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "in=0, load=1, out(t-1)=0, in(t-1)=0") { _ in
            let `in`: Bit = .init(false)
            let load: Bit = .init(false)
            var register = Register()
            register.dffGate = dffGate
            let result = register.output(in: `in`, load: load)
            let expectation: Bit = .init(false)
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "in=1, load=0, out(t-1)=0, in(t-1)=0") { _ in
            let `in`: Bit = .init(false)
            let load: Bit = .init(false)
            var register = Register()
            register.dffGate = dffGate
            let result = register.output(in: `in`, load: load)
            let expectation: Bit = .init(false)
            
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "in=1, load=1, out(t-1)=0, in(t-1)=0") { _ in
            let `in`: Bit = .init(false)
            let load: Bit = .init(false)
            var register = Register()
            register.dffGate = dffGate
            let result = register.output(in: `in`, load: load)
            let expectation: Bit = .init(false)
            
            XCTAssertEqual(result, expectation)
        }
    }
    
    func testRegister_Sequence() {
        XCTContext.runActivity(named: "sequence 1") { _ in
            var register = Register()
            let dffGate = DFF(Bit.init(false))
            register.dffGate = dffGate
         
            XCTAssertEqual(register.output(in: .init(true), load: .init(false)), .init(false))
            XCTAssertEqual(register.output(in: .init(true), load: .init(true)), .init(false))
            XCTAssertEqual(register.output(in: .init(false), load: .init(false)), .init(true))
            XCTAssertEqual(register.output(in: .init(false), load: .init(false)), .init(true))
            XCTAssertEqual(register.output(in: .init(false), load: .init(true)), .init(true))
            XCTAssertEqual(register.output(in: .init(false), load: .init(false)), .init(false))
        }
        
        XCTContext.runActivity(named: "sequence 2") { _ in
            var register = Register()
            let dffGate = DFF(Bit.init(false))
            register.dffGate = dffGate
            
            XCTAssertEqual(register.output(in: .init(false), load: .init(false)), .init(false))
            XCTAssertEqual(register.output(in: .init(true), load: .init(true)), .init(false))
            XCTAssertEqual(register.output(in: .init(false), load: .init(true)), .init(true))
            XCTAssertEqual(register.output(in: .init(false), load: .init(true)), .init(false))
            XCTAssertEqual(register.output(in: .init(false), load: .init(false)), .init(false))
        }
    }
}
