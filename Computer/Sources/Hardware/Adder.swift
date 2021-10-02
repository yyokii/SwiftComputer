//
//  Adder.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/02.
//

public struct AdderOutput: Equatable {
    let sum: Bit
    let carry: Bit
}

public protocol AdderProtocol {
    static func halfAdder(a: Bit, b: Bit) -> AdderOutput
    static func fullAdder(a: Bit, b: Bit, c: Bit) -> AdderOutput
    static func add16(a: Bit16, b: Bit16) -> Bit16
    static func inc16(a: Bit16) -> Bit16
}

public struct Adder: AdderProtocol {
    public static func halfAdder(a: Bit, b: Bit) -> AdderOutput {
        .init(sum: Gate.xor(a: a, b: b),
              carry: Gate.and(a: a, b: b))
    }
    
    public static func fullAdder(a: Bit, b: Bit, c: Bit) -> AdderOutput {
        let tmpSum = Gate.xor(a: a, b: b)
        
        return .init(sum: Gate.xor(a: Gate.xor(a: a, b: b), b: c),
                     carry: Gate.or(a: Gate.and(a: a, b: b), b: Gate.and(a: tmpSum, b: c)))
    }
    
    public static func add16(a: Bit16, b: Bit16) -> Bit16 {
        let add1 = halfAdder(a: a.values.0, b: b.values.0)
        let add2 = fullAdder(a: a.values.1, b: b.values.1, c: add1.carry)
        let add3 = fullAdder(a: a.values.2, b: b.values.2, c: add2.carry)
        let add4 = fullAdder(a: a.values.3, b: b.values.3, c: add3.carry)
        let add5 = fullAdder(a: a.values.4, b: b.values.4, c: add4.carry)
        let add6 = fullAdder(a: a.values.5, b: b.values.5, c: add5.carry)
        let add7 = fullAdder(a: a.values.6, b: b.values.6, c: add6.carry)
        let add8 = fullAdder(a: a.values.7, b: b.values.7, c: add7.carry)
        let add9 = fullAdder(a: a.values.8, b: b.values.8, c: add8.carry)
        let add10 = fullAdder(a: a.values.9, b: b.values.9, c: add9.carry)
        let add11 = fullAdder(a: a.values.10, b: b.values.10, c: add10.carry)
        let add12 = fullAdder(a: a.values.11, b: b.values.11, c: add11.carry)
        let add13 = fullAdder(a: a.values.12, b: b.values.12, c: add12.carry)
        let add14 = fullAdder(a: a.values.13, b: b.values.13, c: add13.carry)
        let add15 = fullAdder(a: a.values.14, b: b.values.14, c: add14.carry)
        let add16 = fullAdder(a: a.values.15, b: b.values.15, c: add15.carry)
        
        return Bit16((add1.sum, add2.sum, add3.sum, add4.sum, add5.sum, add6.sum, add7.sum, add8.sum, add9.sum, add10.sum, add11.sum, add12.sum, add13.sum, add14.sum, add15.sum, add16.sum))
    }
    
    public static func inc16(a: Bit16) -> Bit16 {
        add16(a: a, b: Bit16.one)
    }
}
