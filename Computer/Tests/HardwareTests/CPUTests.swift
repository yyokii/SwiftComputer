//
//  CPUTests.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/31.
//

import XCTest
@testable import Hardware

extension String {
    func zeroPadding(toSize: Int) -> String {
        var padded = self
        for _ in 0..<(toSize - count) {
            padded = "0" + padded
        }
        return padded
    }
}

final class CPUTests: XCTestCase {
    
    private func convertTo15DigitBinary(from num: Int) -> String {
        let binary = String(num, radix: 2)
        return binary.zeroPadding(toSize: 15)
    }
    
    private func convertTo16DigitBinary(from num: Int) -> String {
        let binary = String(num, radix: 2)
        return binary.zeroPadding(toSize: 16)
    }
    
    func test01() {
        let cpu = CPU()
        
        let result0 = cpu.output(inM: .allZero, instruction: .make(from: "0011000000111001"), reset: .init(false))
        XCTAssertEqual(result0.writeM, .init(false))
        XCTAssertEqual(result0.addressM, .allZero)
        XCTAssertEqual(result0.pc, .allZero)
        
        let result1 = cpu.output(inM: .allZero, instruction: .make(from: "1110110000010000"), reset: .init(false))
        let expectationAddressM1 = Bit15.make(from: convertTo15DigitBinary(from: 12345))
        let expectationPC1 = Adder15.inc(a: .allZero)
        XCTAssertEqual(result1.writeM, .init(false))
        XCTAssertEqual(result1.addressM, expectationAddressM1)
        XCTAssertEqual(result1.pc, expectationPC1)
        
        let result2 = cpu.output(inM: .allZero, instruction: .make(from: "0101101110100000"), reset: .init(false))
        let expectationAddressM2 = Bit15.make(from: convertTo15DigitBinary(from: 12345))
        let expectationPC2 = Adder15.inc(a: expectationPC1)
        XCTAssertEqual(result2.writeM, .init(false))
        XCTAssertEqual(result2.addressM, expectationAddressM2)
        XCTAssertEqual(result2.pc, expectationPC2)
        
        let result3 = cpu.output(inM: .allZero, instruction: .make(from: "1110000111010000"), reset: .init(false))
        let expectationAddressM3 = Bit15.make(from: convertTo15DigitBinary(from: 23456))
        let expectationPC3 = Adder15.inc(a: expectationPC2)
        XCTAssertEqual(result3.writeM, .init(false))
        XCTAssertEqual(result3.addressM, expectationAddressM3)
        XCTAssertEqual(result3.pc, expectationPC3)
        
        let result4 = cpu.output(inM: .allZero, instruction: .make(from: "0000001111101000"), reset: .init(false))
        let expectationAddressM4 = Bit15.make(from: convertTo15DigitBinary(from: 23456))
        let expectationPC4 = Adder15.inc(a: expectationPC3)
        XCTAssertEqual(result4.writeM, .init(false))
        XCTAssertEqual(result4.addressM, expectationAddressM4)
        XCTAssertEqual(result4.pc, expectationPC4)
        
        let result5 = cpu.output(inM: .allZero, instruction: .make(from: "1110001100001000"), reset: .init(false))
        let expectationAddressM5 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC5 = Adder15.inc(a: expectationPC4)
        XCTAssertEqual(result5.outM, Bit16.make(from: convertTo16DigitBinary(from: 11111)))
        XCTAssertEqual(result5.writeM, .init(true))
        XCTAssertEqual(result5.addressM, expectationAddressM5)
        XCTAssertEqual(result5.pc, expectationPC5)
        
        let result6 = cpu.output(inM: .allZero, instruction: .make(from: "0000001111101001"), reset: .init(false))
        let expectationAddressM6 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC6 = Adder15.inc(a: expectationPC5)
        XCTAssertEqual(result6.writeM, .init(false))
        XCTAssertEqual(result6.addressM, expectationAddressM6)
        XCTAssertEqual(result6.pc, expectationPC6)
        
        let result7 = cpu.output(inM: .allZero, instruction: .make(from: "1110001110011000"), reset: .init(false))
        let expectationAddressM7 = Bit15.make(from: convertTo15DigitBinary(from: 1001))
        let expectationPC7 = Adder15.inc(a: expectationPC6)
        XCTAssertEqual(result7.outM, Bit16.make(from: convertTo16DigitBinary(from: 11110)))
        XCTAssertEqual(result7.writeM, .init(true))
        XCTAssertEqual(result7.addressM, expectationAddressM7)
        XCTAssertEqual(result7.pc, expectationPC7)// , 7
        
        let result8 = cpu.output(inM: .allZero, instruction: .make(from: "0000001111101000"), reset: .init(false))
        let expectationAddressM8 = Bit15.make(from: convertTo15DigitBinary(from: 1001))
        let expectationPC8 = Adder15.inc(a: expectationPC7)
        XCTAssertEqual(result8.writeM, .init(false))
        XCTAssertEqual(result8.addressM, expectationAddressM8)
        XCTAssertEqual(result8.pc, expectationPC8)
        
        let result9 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1111010011010000"), reset: .init(false))
        let expectationAddressM9 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC9 = Adder15.inc(a: expectationPC8)
        XCTAssertEqual(result9.writeM, .init(false))
        XCTAssertEqual(result9.addressM, expectationAddressM9)
        XCTAssertEqual(result9.pc, expectationPC9)
        
        let result10 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "0000000000001110"), reset: .init(false))
        let expectationAddressM10 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC10 = Adder15.inc(a: expectationPC9)
        XCTAssertEqual(result10.writeM, .init(false))
        XCTAssertEqual(result10.addressM, expectationAddressM10)
        XCTAssertEqual(result10.pc, expectationPC10)
        
        let result11 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000100"), reset: .init(false))
        let expectationAddressM11 = Bit15.make(from: convertTo15DigitBinary(from: 14))
        let expectationPC11 = Adder15.inc(a: expectationPC10)
        XCTAssertEqual(result11.writeM, .init(false))
        XCTAssertEqual(result11.addressM, expectationAddressM11)
        XCTAssertEqual(result11.pc, expectationPC11)
        
        let result12 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "0000001111100111"), reset: .init(false))
        let expectationAddressM12 = Bit15.make(from: convertTo15DigitBinary(from: 14))
        let expectationPC12 = Bit15.make(from: convertTo15DigitBinary(from: 14))
        XCTAssertEqual(result12.writeM, .init(false))
        XCTAssertEqual(result12.addressM, expectationAddressM12)
        XCTAssertEqual(result12.pc, expectationPC12)
        
        let result13 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110110111100000"), reset: .init(false))
        let expectationAddressM13 = Bit15.make(from: convertTo15DigitBinary(from: 999))
        let expectationPC13 = Adder15.inc(a: expectationPC12)
        XCTAssertEqual(result13.writeM, .init(false))
        XCTAssertEqual(result13.addressM, expectationAddressM13)
        XCTAssertEqual(result13.pc, expectationPC13)
        
        let result14 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100001000"), reset: .init(false))
        let expectationAddressM14 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC14 = Adder15.inc(a: expectationPC13)
        XCTAssertEqual(result14.outM, Bit16.allOne)
        XCTAssertEqual(result14.writeM, .init(true))
        XCTAssertEqual(result14.addressM, expectationAddressM14)
        XCTAssertEqual(result14.pc, expectationPC14)
        
        let result15 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "0000000000010101"), reset: .init(false))
        let expectationAddressM15 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC15 = Adder15.inc(a: expectationPC14)
        XCTAssertEqual(result15.writeM, .init(false))
        XCTAssertEqual(result15.addressM, expectationAddressM15)
        XCTAssertEqual(result15.pc, expectationPC15)
        
        let result16 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110011111000010"), reset: .init(false))
        let expectationAddressM16 = Bit15.make(from: convertTo15DigitBinary(from: 21))
        let expectationPC16 = Adder15.inc(a: expectationPC15)
        XCTAssertEqual(result16.writeM, .init(false))
        XCTAssertEqual(result16.addressM, expectationAddressM16)
        XCTAssertEqual(result16.pc, expectationPC16)
        
        let result17 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "0000000000000010"), reset: .init(false))
        let expectationAddressM17 = Bit15.make(from: convertTo15DigitBinary(from: 21))
        let expectationPC17 = Bit15.make(from: convertTo15DigitBinary(from: 21))
        XCTAssertEqual(result17.writeM, .init(false))
        XCTAssertEqual(result17.addressM, expectationAddressM17)
        XCTAssertEqual(result17.pc, expectationPC17)
        
        let result18 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "0000000000000010"), reset: .init(false))
        let expectationAddressM18 = Bit15.make(from: convertTo15DigitBinary(from: 2))
        let expectationPC18 = Adder15.inc(a: expectationPC17)
        XCTAssertEqual(result18.writeM, .init(false))
        XCTAssertEqual(result18.addressM, expectationAddressM18)
        XCTAssertEqual(result18.pc, expectationPC18)
        
        let result19 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "0000001111101000"), reset: .init(false))
        let expectationAddressM19 = Bit15.make(from: convertTo15DigitBinary(from: 2))
        let expectationPC19 = Adder15.inc(a: expectationPC18)
        XCTAssertEqual(result19.writeM, .init(false))
        XCTAssertEqual(result19.addressM, expectationAddressM19)
        XCTAssertEqual(result19.pc, expectationPC19)
        
        let result20 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110111010010000"), reset: .init(false))
        let expectationAddressM20 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC20 = Adder15.inc(a: expectationPC19)
        XCTAssertEqual(result20.writeM, .init(false))
        XCTAssertEqual(result20.addressM, expectationAddressM20)
        XCTAssertEqual(result20.pc, expectationPC20)
        
        let result21 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000001"), reset: .init(false))
        let expectationAddressM21 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC21 = Adder15.inc(a: expectationPC20)
        XCTAssertEqual(result21.writeM, .init(false))
        XCTAssertEqual(result21.addressM, expectationAddressM21)
        XCTAssertEqual(result21.pc, expectationPC21)
        
        let result22 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000010"), reset: .init(false))
        let expectationAddressM22 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC22 = Adder15.inc(a: expectationPC21)
        XCTAssertEqual(result22.writeM, .init(false))
        XCTAssertEqual(result22.addressM, expectationAddressM22)
        XCTAssertEqual(result22.pc, expectationPC22)
        
        let result23 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000011"), reset: .init(false))
        let expectationAddressM23 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC23 = Adder15.inc(a: expectationPC22)
        XCTAssertEqual(result23.writeM, .init(false))
        XCTAssertEqual(result23.addressM, expectationAddressM23)
        XCTAssertEqual(result23.pc, expectationPC23)
        
        let result24 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000100"), reset: .init(false))
        let expectationAddressM24 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC24 = Adder15.inc(a: expectationPC23)
        XCTAssertEqual(result24.writeM, .init(false))
        XCTAssertEqual(result24.addressM, expectationAddressM24)
        XCTAssertEqual(result24.pc, expectationPC24)
        
        let result25 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000101"), reset: .init(false))
        let expectationAddressM25 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC25 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        XCTAssertEqual(result25.writeM, .init(false))
        XCTAssertEqual(result25.addressM, expectationAddressM25)
        XCTAssertEqual(result25.pc, expectationPC25)
        
        let result26 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000110"), reset: .init(false))
        let expectationAddressM26 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC26 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        XCTAssertEqual(result26.writeM, .init(false))
        XCTAssertEqual(result26.addressM, expectationAddressM26)
        XCTAssertEqual(result26.pc, expectationPC26)
        
        let result27 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000111"), reset: .init(false))
        let expectationAddressM27 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC27 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        XCTAssertEqual(result27.writeM, .init(false))
        XCTAssertEqual(result27.addressM, expectationAddressM27)
        XCTAssertEqual(result27.pc, expectationPC27)
        
        let result28 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110101010010000"), reset: .init(false))
        let expectationAddressM28 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC28 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        XCTAssertEqual(result28.writeM, .init(false))
        XCTAssertEqual(result28.addressM, expectationAddressM28)
        XCTAssertEqual(result28.pc, expectationPC28)
        
        let result29 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000001"), reset: .init(false))
        let expectationAddressM29 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC29 = Bit15.make(from: convertTo15DigitBinary(from: 1001))
        XCTAssertEqual(result29.writeM, .init(false))
        XCTAssertEqual(result29.addressM, expectationAddressM29)
        XCTAssertEqual(result29.pc, expectationPC29)
        
        let result30 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000010"), reset: .init(false))
        let expectationAddressM30 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC30 = Bit15.make(from: convertTo15DigitBinary(from: 1002))
        XCTAssertEqual(result30.writeM, .init(false))
        XCTAssertEqual(result30.addressM, expectationAddressM30)
        XCTAssertEqual(result30.pc, expectationPC30)
        
        let result31 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000011"), reset: .init(false))
        let expectationAddressM31 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC31 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        XCTAssertEqual(result31.writeM, .init(false))
        XCTAssertEqual(result31.addressM, expectationAddressM31)
        XCTAssertEqual(result31.pc, expectationPC31)
        
        let result32 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000100"), reset: .init(false))
        let expectationAddressM32 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC32 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        XCTAssertEqual(result32.writeM, .init(false))
        XCTAssertEqual(result32.addressM, expectationAddressM32)
        XCTAssertEqual(result32.pc, expectationPC32)
        
        let result33 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000101"), reset: .init(false))
        let expectationAddressM33 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC33 = Bit15.make(from: convertTo15DigitBinary(from: 1001))
        XCTAssertEqual(result33.writeM, .init(false))
        XCTAssertEqual(result33.addressM, expectationAddressM33)
        XCTAssertEqual(result33.pc, expectationPC33)
        
        let result34 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000110"), reset: .init(false))
        let expectationAddressM34 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC34 = Bit15.make(from: convertTo15DigitBinary(from: 1002))
        XCTAssertEqual(result34.writeM, .init(false))
        XCTAssertEqual(result34.addressM, expectationAddressM34)
        XCTAssertEqual(result34.pc, expectationPC34)
        
        let result35 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000111"), reset: .init(false))
        let expectationAddressM35 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC35 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        XCTAssertEqual(result35.writeM, .init(false))
        XCTAssertEqual(result35.addressM, expectationAddressM35)
        XCTAssertEqual(result35.pc, expectationPC35)
        
        let result36 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110111111010000"), reset: .init(false))
        let expectationAddressM36 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC36 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        XCTAssertEqual(result36.writeM, .init(false))
        XCTAssertEqual(result36.addressM, expectationAddressM36)
        XCTAssertEqual(result36.pc, expectationPC36)
        
        let result37 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000001"), reset: .init(false))
        let expectationAddressM37 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC37 = Bit15.make(from: convertTo15DigitBinary(from: 1001))
        XCTAssertEqual(result37.writeM, .init(false))
        XCTAssertEqual(result37.addressM, expectationAddressM37)
        XCTAssertEqual(result37.pc, expectationPC37)
        
        let result38 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000010"), reset: .init(false))
        let expectationAddressM38 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC38 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        XCTAssertEqual(result38.writeM, .init(false))
        XCTAssertEqual(result38.addressM, expectationAddressM38)
        XCTAssertEqual(result38.pc, expectationPC38)
        
        let result39 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000011"), reset: .init(false))
        let expectationAddressM39 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC39 = Bit15.make(from: convertTo15DigitBinary(from: 1001))
        XCTAssertEqual(result39.writeM, .init(false))
        XCTAssertEqual(result39.addressM, expectationAddressM39)
        XCTAssertEqual(result39.pc, expectationPC39)
        
        let result40 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000100"), reset: .init(false))
        let expectationAddressM40 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC40 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        XCTAssertEqual(result40.writeM, .init(false))
        XCTAssertEqual(result40.addressM, expectationAddressM40)
        XCTAssertEqual(result40.pc, expectationPC40)
        
        let result41 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000101"), reset: .init(false))
        let expectationAddressM41 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC41 = Bit15.make(from: convertTo15DigitBinary(from: 1001))
        XCTAssertEqual(result41.writeM, .init(false))
        XCTAssertEqual(result41.addressM, expectationAddressM41)
        XCTAssertEqual(result41.pc, expectationPC41)
        
        let result42 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000110"), reset: .init(false))
        let expectationAddressM42 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC42 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        XCTAssertEqual(result42.writeM, .init(false))
        XCTAssertEqual(result42.addressM, expectationAddressM42)
        XCTAssertEqual(result42.pc, expectationPC42)
        
        let result43 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000111"), reset: .init(false))
        let expectationAddressM43 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC43 = Bit15.make(from: convertTo15DigitBinary(from: 1001))
        XCTAssertEqual(result43.writeM, .init(false))
        XCTAssertEqual(result43.addressM, expectationAddressM43)
        XCTAssertEqual(result43.pc, expectationPC43)
        
        let result44 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "1110001100000111"), reset: .init(true))
        let expectationAddressM44 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC44 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        XCTAssertEqual(result44.writeM, .init(false))
        XCTAssertEqual(result44.addressM, expectationAddressM44)
        XCTAssertEqual(result44.pc, expectationPC44)
   
        let result45 = cpu.output(inM: Bit16.make(from: convertTo16DigitBinary(from: 11111)), instruction: .make(from: "0111111111111111"), reset: .init(true))
        let expectationAddressM45 = Bit15.make(from: convertTo15DigitBinary(from: 1000))
        let expectationPC45 = Bit15.allZero
        XCTAssertEqual(result45.writeM, .init(false))
        XCTAssertEqual(result45.addressM, expectationAddressM45)
        XCTAssertEqual(result45.pc, expectationPC45)
    }
}
