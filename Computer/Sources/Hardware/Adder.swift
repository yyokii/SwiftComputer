//
//  Adder.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/02.
//

public struct AdderOutput {
    let sum: Bit
    let carry: Bit
}

public protocol AdderProtocol {
    static func halfAdder(a: Bit, b: Bit) -> AdderOutput
    static func fullAdder(a: Bit, b: Bit, c: Bit) -> AdderOutput
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
    
    //    public func add16(a: Bit16, b: Bit16) {
    //        var res: [Bool] = []
    //
    //        var tempSum: Bool = halfAdder(a: a[0], b: b[0]).sum
    //        res.append(tempSum)
    //
    //        for index in 1..<16 {
    //            let sum = fullAdder(a: a[index], b: b[index], c: tempSum).sum
    //            res.append(sum)
    //            tempSum = sum
    //        }
    //    }
}
