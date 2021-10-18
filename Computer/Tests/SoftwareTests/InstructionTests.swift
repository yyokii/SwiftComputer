//
//  InstructionTests.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/18.
//

import Foundation
import XCTest
@testable import Software

final class InstructionTests: XCTestCase {
    func testAddressInstitution_WhenInputIsNum() {
        XCTContext.runActivity(named: "input: 0") { _ in
            // Given
            let num = 0
            let line = "@\(num)"
            
            // When
            let institution: Instruction = .address(text: line)
            let result = institution.parse()
            let expectation = "0000000000000000"
            
            // Then
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "input: 10") { _ in
            // Given
            let num = 10
            let line = "@\(num)"
            
            // When
            let institution: Instruction = .address(text: line)
            let result = institution.parse()
            let expectation = "0000000000001010"
            
            // Then
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "input: 100") { _ in
            // Given
            let num = 100
            let line = "@\(num)"
            
            // When
            let institution: Instruction = .address(text: line)
            let result = institution.parse()
            let expectation = "0000000001100100"
            
            // Then
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "input: 1000") { _ in
            // Given
            let num = 1000
            let line = "@\(num)"
            
            // When
            let institution: Instruction = .address(text: line)
            let result = institution.parse()
            let expectation = "0000001111101000"
            
            // Then
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "input: 10000") { _ in
            // Given
            let num = 10000
            let line = "@\(num)"
            
            // When
            let institution: Instruction = .address(text: line)
            let result = institution.parse()
            let expectation = "0010011100010000"
            
            // Then
            XCTAssertEqual(result, expectation)
        }
        
        XCTContext.runActivity(named: "input: 32767") { _ in
            // Given
            let num = 32767
            let line = "@\(num)"
            
            // When
            let institution: Instruction = .address(text: line)
            let result = institution.parse()
            let expectation = "0111111111111111"
            
            // Then
            XCTAssertEqual(result, expectation)
        }
    }
    
    // Reference: https://github.com/freddi-kit/Swift2Tetris/blob/master/Tests/Swift2TetrisSoftwareKitTests/AssemblerTest.swift
    func testParse_Rect() throws {
        // Given
        let asm = """
            @0
            D=M
            @INFINITE_LOOP
            D;JLE
            @counter
            M=D
            @SCREEN
            D=A
            @address
            M=D
         (LOOP)
            @address
            A=M
            M=-1
            @address
            D=M
            @32
            D=D+A
            @address
            M=D
            @counter
            MD=M-1
            @LOOP
            D;JGT
         (INFINITE_LOOP)
            @INFINITE_LOOP
            0;JMP
        """
        
        // When
        let assembler = Assembler()
        let result = assembler.parse(text: asm)
        let expectation = [
            "0000000000000000",
            "1111110000010000",
            "0000000000010111",
            "1110001100000110",
            "0000000000010000",
            "1110001100001000",
            "0100000000000000",
            "1110110000010000",
            "0000000000010001",
            "1110001100001000",
            "0000000000010001",
            "1111110000100000",
            "1110111010001000",
            "0000000000010001",
            "1111110000010000",
            "0000000000100000",
            "1110000010010000",
            "0000000000010001",
            "1110001100001000",
            "0000000000010000",
            "1111110010011000",
            "0000000000001010",
            "1110001100000001",
            "0000000000010111",
            "1110101010000111",
        ]
        
        // Then
        XCTAssertEqual(result.count, expectation.count);
        var line = 0
        for (i, j) in zip(result, expectation) {
            XCTAssertEqual(i, j, "line\(line) is not same")
            line += 1
        }
    }
    
    // Reference: https://github.com/freddi-kit/Swift2Tetris/blob/master/Tests/Swift2TetrisSoftwareKitTests/AssemblerTest.swift
    func testParse_RectL() throws {
        let asm = """
        @0
        D=M
        @23
        D;JLE
        @16
        M=D
        @16384
        D=A
        @17
        M=D
        @17
        A=M
        M=-1
        @17
        D=M
        @32
        D=D+A
        @17
        M=D
        @16
        MD=M-1
        @10
        D;JGT
        @23
        0;JMP
        """
        
        // When
        let assembler = Assembler()
        let result = assembler.parse(text: asm)
        let expectation = [
            "0000000000000000",
            "1111110000010000",
            "0000000000010111",
            "1110001100000110",
            "0000000000010000",
            "1110001100001000",
            "0100000000000000",
            "1110110000010000",
            "0000000000010001",
            "1110001100001000",
            "0000000000010001",
            "1111110000100000",
            "1110111010001000",
            "0000000000010001",
            "1111110000010000",
            "0000000000100000",
            "1110000010010000",
            "0000000000010001",
            "1110001100001000",
            "0000000000010000",
            "1111110010011000",
            "0000000000001010",
            "1110001100000001",
            "0000000000010111",
            "1110101010000111",
        ]
        
        // Then
        XCTAssertEqual(result.count, expectation.count);
        var line = 0
        for (i, j) in zip(result, expectation) {
            XCTAssertEqual(i, j, "line\(line) is not same")
            line += 1
        }
    }
}
