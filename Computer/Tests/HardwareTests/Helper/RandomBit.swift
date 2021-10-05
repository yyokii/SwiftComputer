//
//  RandomBit.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/05.
//

import Hardware

extension Bit {
    static func random() -> Self {
        return Int.random(in: 0...1) == 1 ? .init(true) : .init(false)
    }
}
