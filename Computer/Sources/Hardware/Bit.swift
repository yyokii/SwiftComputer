//
//  Bit.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/02.
//


public struct Bit: Equatable {
    let value: Bool
    
    public init(_ bit: Bool) {
        value = bit
    }
}

public struct Bit2: Equatable {
    var values: (Bit, Bit)
    
    public init(_ bits: (Bit, Bit)) {
        values = bits
    }
    
    public static func == (lhs: Bit2, rhs: Bit2) -> Bool {
        lhs.values.0 == rhs.values.0
        && lhs.values.1 == rhs.values.1
    }
}

public struct Bit3: Equatable {
    var values: (Bit, Bit, Bit)
    
    public init(_ bits: (Bit, Bit, Bit)) {
        values = bits
    }
    
    public static func == (lhs: Bit3, rhs: Bit3) -> Bool {
        lhs.values.0 == rhs.values.0
        && lhs.values.1 == rhs.values.1
        && lhs.values.2 == rhs.values.2
    }
}

public struct Bit4: Equatable {
    var values: (Bit, Bit, Bit, Bit)
    
    public init(_ bits: (Bit, Bit, Bit, Bit)) {
        values = bits
    }
    
    public static func == (lhs: Bit4, rhs: Bit4) -> Bool {
        lhs.values.0 == rhs.values.0
        && lhs.values.1 == rhs.values.1
        && lhs.values.2 == rhs.values.2
        && lhs.values.3 == rhs.values.3
    }
}

public struct Bit8: Equatable {
    var values: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)
    
    public init(_ bits: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)) {
        values = bits
    }
    
    public static func == (lhs: Bit8, rhs: Bit8) -> Bool {
        lhs.values.0 == rhs.values.0
        && lhs.values.1 == rhs.values.1
        && lhs.values.2 == rhs.values.2
        && lhs.values.3 == rhs.values.3
        && lhs.values.4 == rhs.values.4
        && lhs.values.5 == rhs.values.5
        && lhs.values.6 == rhs.values.6
        && lhs.values.7 == rhs.values.7
    }
}

public struct Bit16: Equatable {
    var values: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)
    
    public init(_ bits: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)) {
        values = bits
    }
    
    public static func == (lhs: Bit16, rhs: Bit16) -> Bool {
        lhs.values.0 == rhs.values.0
        && lhs.values.1 == rhs.values.1
        && lhs.values.2 == rhs.values.2
        && lhs.values.3 == rhs.values.3
        && lhs.values.4 == rhs.values.4
        && lhs.values.5 == rhs.values.5
        && lhs.values.6 == rhs.values.6
        && lhs.values.7 == rhs.values.7
        && lhs.values.8 == rhs.values.8
        && lhs.values.9 == rhs.values.9
        && lhs.values.10 == rhs.values.10
        && lhs.values.11 == rhs.values.11
        && lhs.values.12 == rhs.values.12
        && lhs.values.13 == rhs.values.13
        && lhs.values.14 == rhs.values.14
        && lhs.values.15 == rhs.values.15
    }
}


extension Bit16 {
    static let one = (Bit.init(true), Bit.init(false), Bit.init(false), Bit.init(false), Bit.init(false),
                      Bit.init(false), Bit.init(false), Bit.init(false), Bit.init(false), Bit.init(false),
                      Bit.init(false), Bit.init(false), Bit.init(false), Bit.init(false), Bit.init(false),
                      Bit.init(false))
    
    static let allOne = (Bit.init(true), Bit.init(true), Bit.init(true), Bit.init(true), Bit.init(true),
                         Bit.init(true), Bit.init(true), Bit.init(true), Bit.init(true), Bit.init(true),
                         Bit.init(true), Bit.init(true), Bit.init(true), Bit.init(true), Bit.init(true),
                         Bit.init(true))
    
    static let allZero = (Bit.init(false), Bit.init(false), Bit.init(false), Bit.init(false), Bit.init(false),
                          Bit.init(false), Bit.init(false), Bit.init(false), Bit.init(false), Bit.init(false),
                          Bit.init(false), Bit.init(false), Bit.init(false), Bit.init(false), Bit.init(false),
                          Bit.init(false))
}
