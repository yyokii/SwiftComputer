//
//  Bit.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/02.
//

/*
 Equatable compliant for testing
 */

public protocol BitRepresentable {}

public struct Bit: BitRepresentable, Equatable {
    let value: Bool
    
    public init(_ bit: Bool) {
        value = bit
    }
}

public struct Bit2: BitRepresentable, Equatable {
    var values: (Bit, Bit)
    
    public init(_ bits: (Bit, Bit)) {
        values = bits
    }
    
    public static func == (lhs: Bit2, rhs: Bit2) -> Bool {
        lhs.values.0 == rhs.values.0
        && lhs.values.1 == rhs.values.1
    }
}

public struct Bit3: BitRepresentable, Equatable {
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

public struct Bit4: BitRepresentable, Equatable {
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

public struct Bit6: BitRepresentable, Equatable {
    var values: (Bit, Bit, Bit, Bit, Bit, Bit)
    
    public init(_ bits: (Bit, Bit, Bit, Bit, Bit, Bit)) {
        values = bits
    }
    
    public static func == (lhs: Bit6, rhs: Bit6) -> Bool {
        lhs.values.0 == rhs.values.0
        && lhs.values.1 == rhs.values.1
        && lhs.values.2 == rhs.values.2
        && lhs.values.3 == rhs.values.3
        && lhs.values.4 == rhs.values.4
        && lhs.values.5 == rhs.values.5
    }
}

public struct Bit7: BitRepresentable, Equatable {
    var values: (Bit, Bit, Bit, Bit, Bit, Bit, Bit)
    
    public init(_ bits: (Bit, Bit, Bit, Bit, Bit, Bit, Bit)) {
        values = bits
    }
    
    public static func == (lhs: Bit7, rhs: Bit7) -> Bool {
        lhs.values.0 == rhs.values.0
        && lhs.values.1 == rhs.values.1
        && lhs.values.2 == rhs.values.2
        && lhs.values.3 == rhs.values.3
        && lhs.values.4 == rhs.values.4
        && lhs.values.5 == rhs.values.5
        && lhs.values.6 == rhs.values.6
    }
}

public struct Bit8: BitRepresentable, Equatable {
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

public struct Bit9: BitRepresentable, Equatable {
    var values: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)
    
    public init(_ bits: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)) {
        values = bits
    }
    
    public static func == (lhs: Bit9, rhs: Bit9) -> Bool {
        lhs.values.0 == rhs.values.0
        && lhs.values.1 == rhs.values.1
        && lhs.values.2 == rhs.values.2
        && lhs.values.3 == rhs.values.3
        && lhs.values.4 == rhs.values.4
        && lhs.values.5 == rhs.values.5
        && lhs.values.6 == rhs.values.6
        && lhs.values.7 == rhs.values.7
        && lhs.values.8 == rhs.values.8
    }
}

public struct Bit12: BitRepresentable, Equatable {
    var values: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)
    
    public init(_ bits: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)) {
        values = bits
    }
    
    public static func == (lhs: Bit12, rhs: Bit12) -> Bool {
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
    }
}

public struct Bit14: BitRepresentable, Equatable {
    var values: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)
    
    public init(_ bits: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)) {
        values = bits
    }
    
    public static func == (lhs: Bit14, rhs: Bit14) -> Bool {
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
    }
}

public struct Bit15: BitRepresentable, Equatable {
    var values: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)
    
    public init(_ bits: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)) {
        values = bits
    }
    
    public static func == (lhs: Bit15, rhs: Bit15) -> Bool {
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
    }
}

public struct Bit16: BitRepresentable, Equatable {
    var values: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)
    
    var isZero: Bit {
        Gate.not(a: Gate.or(a: Gate.or(a: values.0, b: values.1),
                            b: Gate.or(a: Gate.or(a: values.2, b: values.3),
                                       b: Gate.or(a: Gate.or(a: values.4, b: values.5),
                                                  b: Gate.or(a: Gate.or(a: values.6, b: values.7),
                                                             b: Gate.or(a: Gate.or(a: values.8, b: values.9),
                                                                        b: Gate.or(a: Gate.or(a: values.10, b: values.11),
                                                                                   b: Gate.or(a: Gate.or(a: values.12, b: values.13),
                                                                                              b: Gate.or(a: values.14, b: values.15)))))))))
    }
    
    var isNegative: Bit {
        values.15
    }
    
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

extension Bit15 {
    static let one: Self = .init((Bit.init(true), Bit.init(false), Bit.init(false), Bit.init(false),
                                  Bit.init(false),Bit.init(false), Bit.init(false), Bit.init(false),
                                  Bit.init(false), Bit.init(false),Bit.init(false), Bit.init(false),
                                  Bit.init(false), Bit.init(false), Bit.init(false)))
    
    static let allZero: Bit15 = .init((Bit.init(false), Bit.init(false), Bit.init(false), Bit.init(false),
                                Bit.init(false), Bit.init(false), Bit.init(false), Bit.init(false),
                                Bit.init(false), Bit.init(false),Bit.init(false), Bit.init(false),
                                Bit.init(false), Bit.init(false), Bit.init(false)))
}

extension Bit16 {
    static let one: Self = .init((Bit.init(true), Bit.init(false), Bit.init(false), Bit.init(false),
                                  Bit.init(false),Bit.init(false), Bit.init(false), Bit.init(false),
                                  Bit.init(false), Bit.init(false),Bit.init(false), Bit.init(false),
                                  Bit.init(false), Bit.init(false), Bit.init(false),Bit.init(false)))
    
    public static let allOne: Self = .init((Bit.init(true), Bit.init(true), Bit.init(true), Bit.init(true),
                                     Bit.init(true),Bit.init(true), Bit.init(true), Bit.init(true),
                                     Bit.init(true), Bit.init(true),Bit.init(true), Bit.init(true),
                                     Bit.init(true), Bit.init(true), Bit.init(true),Bit.init(true)))
    
    public static let allZero: Self = .init((Bit.init(false), Bit.init(false), Bit.init(false), Bit.init(false),
                                      Bit.init(false),Bit.init(false), Bit.init(false), Bit.init(false),
                                      Bit.init(false), Bit.init(false),Bit.init(false), Bit.init(false),
                                      Bit.init(false), Bit.init(false), Bit.init(false),Bit.init(false)))
}
