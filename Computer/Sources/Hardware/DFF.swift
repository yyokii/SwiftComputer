//
//  DFF.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/03.
//

protocol DFFProtocol {
    associatedtype B: BitRepresentable
    
    var `in`: B { get }
    mutating func dff(_ input: B) -> B
}

struct DFF: DFFProtocol {
    var `in`: Bit
    
    init(_ initialValue: Bit) {
        `in` = initialValue
    }
    
    mutating func dff(_ input: Bit) -> Bit {
        defer { `in` = input }
        return `in`
    }
}

struct DFF16: DFFProtocol {
    var `in`: Bit16
    
    init(_ initialValue: Bit16) {
        `in` = initialValue
    }
    
    mutating func dff(_ input: Bit16) -> Bit16 {
        defer { `in` = input }
        return `in`
    }
}
