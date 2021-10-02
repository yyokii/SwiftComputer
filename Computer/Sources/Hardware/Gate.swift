//
//  Gate.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/01.
//

public protocol GateProtocol {
    static func nand(a: Bit, b: Bit) -> Bit
    static func not(a: Bit) -> Bit
    static func and(a: Bit, b: Bit) -> Bit
    static func or(a: Bit, b: Bit) -> Bit
    static func xor(a: Bit, b: Bit) -> Bit
    static func mux(a: Bit, b: Bit, sel: Bit) -> Bit
    static func dmux(a: Bit, sel: Bit) -> [Bit]
}

public struct Gate {
    public static func nand(a: Bit, b: Bit) -> Bit {
        .init(!(a.value && b.value))
    }

    public static func not(a: Bit) -> Bit {
        nand(a: a, b: a)
    }

    public static func and(a: Bit, b: Bit) -> Bit {
        .init(!nand(a: a, b: b).value)
    }

    public static func or(a: Bit, b: Bit) -> Bit {
        nand(a: not(a: a), b: not(a: b))
    }

    public static func xor(a: Bit, b: Bit) -> Bit {
        or(a: and(a: not(a: a), b: b), b: and(a: a, b: not(a: b)))
    }

    public static func mux(a: Bit, b: Bit, sel: Bit) -> Bit {
        or(a: and(a: a, b: not(a: sel)), b: and(a: b, b: sel))
    }

    public static func dmux(a: Bit, sel: Bit) -> [Bit] {
        [and(a: a, b: not(a: sel)), and(a: a, b: sel)]
    }
}
