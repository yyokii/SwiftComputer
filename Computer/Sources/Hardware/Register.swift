//
//  Register.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/03.
//

protocol RegisterProtocol {
    associatedtype B: BitRepresentable
    
    var load: Bit { get }
    var preOut: B { get }
    mutating func output(in: B, load: Bit) -> B
}

///　値の読み書きが可能な回路
struct Register: RegisterProtocol {
    var dffGate: DFF = DFF(.init(false))
    var load: Bit = .init(false)
    var preOut: Bit = .init(false)

    mutating func output(in: Bit, load: Bit) -> Bit {
        let out = Gate.mux(a: preOut, b: dffGate.dff(`in`), sel: self.load)
       
        self.load = load
        preOut = out
        
        return out
    }
}

struct Register16: RegisterProtocol {
    private var dffGate: DFF16 = DFF16(Bit16.allZero)
    var load: Bit = .init(false)
    var preOut: Bit16 = Bit16.allZero
    
    @discardableResult
    mutating func output(in: Bit16, load: Bit) -> Bit16 {
        let out = MultiGate.mux16(a: preOut, b: dffGate.dff(`in`), sel: self.load)

        self.load = load
        preOut = out
        
        return out
    }
}
