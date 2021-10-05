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

struct Register: RegisterProtocol {
    var dffGate: DFF
    var load: Bit
    var preOut: Bit
    
    init(dff: DFF = DFF(.init(false)), load: Bit = .init(false), _ initialValue: Bit) {
        dffGate = dff
        self.load = load
        preOut = initialValue
    }

    mutating func output(in: Bit, load: Bit) -> Bit {
        let out = Gate.mux(a: preOut, b: dffGate.dff(`in`), sel: self.load)
       
        self.load = load
        preOut = out
        
        return out
    }
}

struct Register16: RegisterProtocol {
    private var dffGate: DFF16
    var load: Bit
    var preOut: Bit16
    
    init(dff: DFF16 = DFF16(Bit16.allZero), load: Bit = .init(false), _ initialValue: Bit16 = Bit16.allZero) {
        dffGate = dff
        self.load = load
        preOut = initialValue
    }

    mutating func output(in: Bit16, load: Bit) -> Bit16 {
        let out = MultiGate.mux16(a: preOut, b: dffGate.dff(`in`), sel: self.load)

        self.load = load
        preOut = out
        
        return out
    }
}
