//
//  BitFromString.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/31.
//

import Hardware

extension StringProtocol {
    subscript(characterIndex: Int) -> String {
        return String(self[index(startIndex, offsetBy: characterIndex)])
    }
}

extension Bit {
    static func make(from text: String) -> Bit {
        precondition(text.count == 1)
        
        if text == "0" {
            return .init(false)
        } else if text == "1" {
            return .init(true)
        } else {
            fatalError()
        }
    }
}

extension Bit15 {
    static func make(from text: String) -> Bit15 {
        precondition(text.count == 15)
        
        let bit15: Bit15 = .init((Bit.make(from: text[14]), Bit.make(from: text[13]), Bit.make(from: text[12]), Bit.make(from: text[11]),
                                  Bit.make(from: text[10]), Bit.make(from: text[9]), Bit.make(from: text[8]), Bit.make(from: text[7]),
                                  Bit.make(from: text[6]), Bit.make(from: text[5]), Bit.make(from: text[4]), Bit.make(from: text[3]),
                                  Bit.make(from: text[2]), Bit.make(from: text[1]), Bit.make(from: text[0])))
        return bit15
    }
}

extension Bit16 {
    static func make(from text: String) -> Bit16 {
        precondition(text.count == 16)
        
        let bit16: Bit16 = .init((Bit.make(from: text[15]), Bit.make(from: text[14]), Bit.make(from: text[13]), Bit.make(from: text[12]),
                                  Bit.make(from: text[11]), Bit.make(from: text[10]), Bit.make(from: text[9]), Bit.make(from: text[8]),
                                  Bit.make(from: text[7]), Bit.make(from: text[6]), Bit.make(from: text[5]), Bit.make(from: text[4]),
                                  Bit.make(from: text[3]), Bit.make(from: text[2]), Bit.make(from: text[1]), Bit.make(from: text[0])))
        return bit16
    }
}
