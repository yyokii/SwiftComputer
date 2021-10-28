//
//  ProgramCounter.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/05.
//

struct ProgramCounter {
    private var register16: Register16 = Register16()
    
    mutating func output(`in`: Bit16, inc: Bit, load: Bit, reset: Bit) -> Bit16 {
        let preValue: Bit16 = register16.output(in: `in`, load: .init(false))
        
        let val = MultiGate.mux8Way16(a: preValue,
                                      b: Adder.inc16(a: preValue),
                                      c: `in`,
                                      d: `in`,
                                      e: Bit16.allZero,
                                      f: Bit16.allZero,
                                      g: Bit16.allZero,
                                      h: Bit16.allZero,
                                      sel: .init((reset,
                                                  load,
                                                  inc)))
        
        return register16.output(in: val, load: .init(true))
    }
}
