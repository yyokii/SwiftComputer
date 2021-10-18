//
//  Assembler.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/07.
//

import Foundation

let builtInSymbol = [
    "R0": 0,
    "R1": 1,
    "R2": 2,
    "R3": 3,
    "R4": 4,
    "R5": 5,
    "R6": 6,
    "R7": 7,
    "R8": 8,
    "R9": 9,
    "R10": 10,
    "R11": 11,
    "R12": 12,
    "R13": 13,
    "R14": 14,
    "R15": 15,
    "SP": 0,
    "LCL": 1,
    "ARG": 2,
    "THIS": 3,
    "THAT": 4,
    "SCREEN": 16384,
    "KBD": 24576
]

var labelSymbolTable: [String: Int] = [:]
var variableSymbolTable: [String: Int] = [:]

protocol AssemblerProtocol {
    func setUpLabelSymbol(lines: [String])
    func parse(line: String) -> String
    func parse(text: String) -> [String]
}

struct Assembler {
    func setUpLabelSymbol(lines: [String]) {
        var lineCount = 0
        for line in lines {
            let line = line.trimmingCharacters(in: .whitespacesAndNewlines)
            if line.hasPrefix("(") && line.hasSuffix(")") {
                guard let firstParentheses = line.firstIndex(of: "("),
                      let endParentheses = line.firstIndex(of: ")") else {
                          continue
                      }
                
                let firstIndex = line.index(after: firstParentheses)
                let symbol = String(line[firstIndex..<endParentheses])
                
                if labelSymbolTable[symbol] == nil {
                    labelSymbolTable[symbol] = lineCount
                    continue
                } else {
                    fatalError("\"\(symbol)\" is duplicate")
                }
            }
            lineCount += 1
        }
    }
    
    func parse(line: String) -> String {
        let line = line.trimmingCharacters(in: .whitespacesAndNewlines)
        var parseType: Parsable?
        
        if line.hasPrefix("@") {
            parseType = Instruction.address(text: line)
        } else if line.hasPrefix("(") {
            return ""
        } else if line.hasPrefix("//") {
            return ""
        } else {
            parseType = Instruction.compute(text: line)
        }
        
        var parsedValue: String = ""
        if let parseType = parseType {
            parsedValue = parseType.parse()
        }
        
        return parsedValue
    }
    
    func parse(text: String) -> [String] {
        let lines: [String] = text.components(separatedBy: "\n")
        
        setUpLabelSymbol(lines: lines)
        
        // Parse
        var codes: [String] = []
        for line in lines {
            let code = parse(line: line)
            if !code.isEmpty {
                codes.append(code)
            }
        }
        
        return codes
    }
}
