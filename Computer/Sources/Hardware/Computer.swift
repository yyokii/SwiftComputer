//
//  Computer.swift
//  
//
//  Created by Higashihara Yoki on 2021/11/13.
//

import Foundation

struct Computer {
    private let cpu = CPU()
    
    // Memory
    private var instructionMemory: RAM32K // use this as ROM
    private let dataMemory: RAM32K = RAM32K()
    
    private var nextInM: Bit16 = .allZero
    private var nextInstructionAddress: Bit15 = .allZero
    
    init(instraction32K: RAM32K) {
        instructionMemory = instraction32K
    }
    
    public mutating func out(reset: Bit) {
        let instruction = instructionMemory.out(in: .allZero, address: nextInstructionAddress, load: .init(false))
        let cpuOutput = cpu.output(inM: nextInM, instruction: instruction, reset: reset)
        
        nextInstructionAddress = cpuOutput.pc
        nextInM = dataMemory.out(in: cpuOutput.outM, address: cpuOutput.addressM, load: cpuOutput.writeM)
    }
}
