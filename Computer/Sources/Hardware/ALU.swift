//
//  ALU.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/03.
//

public struct ALUOutput: Equatable {
    let out: Bit16
    let zr: Bit
    let ng: Bit
}

public protocol ALUProtocol {
    static func alu(x: Bit16, y: Bit16, zx: Bit, nx: Bit, zy: Bit, ny: Bit, f: Bit, no: Bit) -> ALUOutput
}

public struct ALU: ALUProtocol  {
    public static func alu(x: Bit16, y: Bit16, zx: Bit, nx: Bit, zy: Bit, ny: Bit, f: Bit, no: Bit) -> ALUOutput {
        
        let x = negate(zero(x, control: zx), control: nx)
        let y = negate(zero(y, control: zy), control: ny)
        let tmp = selectFunction(a: x, b: y, control: f)
        let out = negate(tmp, control: no)
        
        return .init(out: out, zr: out.isZero, ng: out.isNegative)
    }
    
    static func zero(_ input: Bit16, control: Bit) -> Bit16 {
        MultiGate.mux16(a: input, b: Bit16.allZero, sel: control)
    }
    
    static func negate(_ input: Bit16, control: Bit) -> Bit16 {
        MultiGate.mux16(a: input, b: MultiGate.not16(a: input), sel: control)
    }
    
    static func selectFunction(a: Bit16, b: Bit16, control: Bit) -> Bit16 {
        MultiGate.mux16(a: MultiGate.and16(a: a, b: b), b: Adder16.add(a: a, b: b), sel: control)
    }
}
