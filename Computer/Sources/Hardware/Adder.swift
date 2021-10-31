//
//  Adder.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/02.
//

struct AdderOutput: Equatable {
    let sum: Bit
    let carry: Bit
}

struct Adder {
    static func halfAdder(a: Bit, b: Bit) -> AdderOutput {
        .init(sum: Gate.xor(a: a, b: b),
              carry: Gate.and(a: a, b: b))
    }
    
    static func fullAdder(a: Bit, b: Bit, c: Bit) -> AdderOutput {
        let tmpSum = Gate.xor(a: a, b: b)
        
        return .init(sum: Gate.xor(a: Gate.xor(a: a, b: b), b: c),
                     carry: Gate.or(a: Gate.and(a: a, b: b), b: Gate.and(a: tmpSum, b: c)))
    }
}

struct Adder16 {
    static func add(a: Bit16, b: Bit16) -> Bit16 {
        let add1 = Adder.halfAdder(a: a.values.0, b: b.values.0)
        let add2 = Adder.fullAdder(a: a.values.1, b: b.values.1, c: add1.carry)
        let add3 = Adder.fullAdder(a: a.values.2, b: b.values.2, c: add2.carry)
        let add4 = Adder.fullAdder(a: a.values.3, b: b.values.3, c: add3.carry)
        let add5 = Adder.fullAdder(a: a.values.4, b: b.values.4, c: add4.carry)
        let add6 = Adder.fullAdder(a: a.values.5, b: b.values.5, c: add5.carry)
        let add7 = Adder.fullAdder(a: a.values.6, b: b.values.6, c: add6.carry)
        let add8 = Adder.fullAdder(a: a.values.7, b: b.values.7, c: add7.carry)
        let add9 = Adder.fullAdder(a: a.values.8, b: b.values.8, c: add8.carry)
        let add10 = Adder.fullAdder(a: a.values.9, b: b.values.9, c: add9.carry)
        let add11 = Adder.fullAdder(a: a.values.10, b: b.values.10, c: add10.carry)
        let add12 = Adder.fullAdder(a: a.values.11, b: b.values.11, c: add11.carry)
        let add13 = Adder.fullAdder(a: a.values.12, b: b.values.12, c: add12.carry)
        let add14 = Adder.fullAdder(a: a.values.13, b: b.values.13, c: add13.carry)
        let add15 = Adder.fullAdder(a: a.values.14, b: b.values.14, c: add14.carry)
        let add16 = Adder.fullAdder(a: a.values.15, b: b.values.15, c: add15.carry)
        
        return Bit16((add1.sum, add2.sum, add3.sum, add4.sum, add5.sum, add6.sum, add7.sum, add8.sum, add9.sum, add10.sum, add11.sum, add12.sum, add13.sum, add14.sum, add15.sum, add16.sum))
    }
    
    static func inc(a: Bit16) -> Bit16 {
        add(a: a, b: Bit16.one)
    }
}
