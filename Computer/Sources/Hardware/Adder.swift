//
//  Adder.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/02.
//

public struct AdderOutput {
    let sum: Bool
    let carry: Bool
}

public protocol AdderProtocol {}

public struct Adder: AdderProtocol {
    public func halfAdder(a: Bool, b: Bool) -> AdderOutput {
        .init(sum: xor(a: a, b: b),
              carry: and(a: a, b: b))
    }

    public func fullAdder(a: Bool, b: Bool, c: Bool) -> AdderOutput {
        let tmpSum = xor(a: a, b: b)
        
        return .init(sum: xor(a: xor(a: a, b: b), b: c),
              carry: or(a: and(a: a, b: b), b: and(a: tmpSum, b: c)))
    }

    public func add16(a: [Bool], b: [Bool]) {
        var res: [Bool] = []
        
        var tempSum: Bool = halfAdder(a: a[0], b: b[0]).sum
        res.append(tempSum)
        
        for index in 1..<16 {
            let sum = fullAdder(a: a[index], b: b[index], c: tempSum).sum
            res.append(sum)
            tempSum = sum
        }
    }
}
