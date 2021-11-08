//
//  CPU.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/28.
//

import Foundation

public struct CPUOutput {
    var outM: Bit16
    var writeM: Bit
    var addressM: Bit15
    var pc: Bit15
}


struct DecodedInstruction {
    var isCInstruction: Bit
    var comp: Bit7
    var dest: Bit3
    var jump: Bit3
}


public class CPU {
    private var registerA: Register16 = Register16()
    private var registerD: Register16 = Register16()
    private var programCounter: ProgramCounter = ProgramCounter()
    
    public func output(inM: Bit16, instruction: Bit16, reset: Bit) -> CPUOutput {
        // Decode
        let decodedInstruction = decode(instruction: instruction)
        
        // In case of the A instruction, write to the A register
        let registerAValue = registerA.output(in: instruction, load: Gate.not(a: decodedInstruction.isCInstruction))
        let addressM = Bit15((registerAValue.values.0, registerAValue.values.1, registerAValue.values.2, registerAValue.values.3,
                              registerAValue.values.4, registerAValue.values.5, registerAValue.values.6, registerAValue.values.7,
                              registerAValue.values.8, registerAValue.values.9, registerAValue.values.10, registerAValue.values.11,
                              registerAValue.values.12, registerAValue.values.13, registerAValue.values.14))
        
        // Get current registerD value
        let registerDValue = registerD.output(in: instruction, load: .init(false)) // ここzeroでいい気がする、input?
        
        // C Instruction: comp
        let inputALUy = MultiGate.mux16(a: registerAValue, b: inM, sel: decodedInstruction.comp.values.0)
        let resultALU = ALU.alu(x: registerDValue,
                                y: inputALUy,
                                zx: decodedInstruction.comp.values.1,
                                nx: decodedInstruction.comp.values.2,
                                zy: decodedInstruction.comp.values.3,
                                ny: decodedInstruction.comp.values.4,
                                f: decodedInstruction.comp.values.5,
                                no: decodedInstruction.comp.values.6)
        let outM: Bit16 = resultALU.out
        
        // C Instruction: dest
        registerA.output(in: resultALU.out, load: Gate.and(a: decodedInstruction.isCInstruction, b: decodedInstruction.dest.values.0))
        registerD.output(in: resultALU.out, load: Gate.and(a: decodedInstruction.isCInstruction, b: decodedInstruction.dest.values.1))
        let writeM: Bit = Gate.and(a: decodedInstruction.isCInstruction, b: decodedInstruction.dest.values.2)
        
        // C Instruction: jump
        let jmp = MultiGate.mux8(a: .init(false),
                                 b: Gate.and(a: Gate.not(a: resultALU.ng),
                                             b: Gate.not(a: resultALU.zr)),
                                 c: resultALU.zr,
                                 d: Gate.not(a: resultALU.ng),
                                 e: resultALU.ng,
                                 f: Gate.not(a: resultALU.zr),
                                 g: Gate.or(a: resultALU.zr,
                                            b: resultALU.ng),
                                 h: .init(true),
                                 sel: decodedInstruction.jump)
        let load = Gate.and(a: jmp, b: decodedInstruction.isCInstruction)
        let pc = programCounter.output(in: registerAValue, inc: .init(true), load: load, reset: reset)
        let pc15: Bit15 = Bit15((pc.values.0, pc.values.1, pc.values.2, pc.values.3,
                                 pc.values.4, pc.values.5, pc.values.6, pc.values.7,
                                 pc.values.8, pc.values.9, pc.values.10, pc.values.11,
                                 pc.values.12, pc.values.13, pc.values.14))
        
        return CPUOutput(outM: outM,
                         writeM: writeM,
                         addressM: addressM,
                         pc: pc15)
        
    }
    
    /*
     memo:
     
     (instruction)
     i xx a cccccc ddd jjj
     
     (Bit16 index)
     0        ...        15
     jjj ddd cccccc a xx i
     */
    private func decode(instruction: Bit16) -> DecodedInstruction {
        return DecodedInstruction(isCInstruction: instruction.values.15,
                                  comp: .init((instruction.values.12, instruction.values.11, instruction.values.10, instruction.values.9, instruction.values.8, instruction.values.7, instruction.values.6)),
                                  dest: .init((instruction.values.5, instruction.values.4, instruction.values.3)),
                                  jump: .init((instruction.values.2, instruction.values.1, instruction.values.0)))
    }
}
