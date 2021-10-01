//
//  Gate.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/01.
//

public func nand(a: Bool, b: Bool) -> Bool {
    !(a && b)
}

public func not(a: Bool) -> Bool {
    nand(a: a, b: a)
}

public func and(a: Bool, b: Bool) -> Bool {
    !nand(a: a, b: b)
}

public func or(a: Bool, b: Bool) -> Bool {
    nand(a: not(a: a), b: not(a: b))
}

public func xor(a: Bool, b: Bool) -> Bool {
    or(a: and(a: not(a: a), b: b), b: and(a: a, b: not(a: b)))
}

public func mux(a: Bool, b: Bool, sel: Bool) -> Bool {
    or(a: and(a: a, b: not(a: sel)), b: and(a: b, b: sel))
}

public func dmux(a: Bool, sel: Bool) -> [Bool] {
    [and(a: a, b: not(a: sel)), and(a: a, b: sel)]
}


