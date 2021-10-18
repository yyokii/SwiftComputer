//
//  Parsable.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/15.
//

import Foundation
import XCTest

protocol Parsable {
    func parse() -> String
}

extension Parsable {
    func convertTo16DigitBinary(from num: Int) -> String {
        let binary = String(num, radix: 2)
        return binary.zeroPadding(toSize: 16)
    }
}

/// Address Instruction or Compute Instruction
enum Instruction: Parsable {
    case address(text: String)
    case compute(text: String)
    
    func parse() -> String {
        switch self {
        case .address(let text):
            return parseAddressInstruction(text: text)
        case .compute(let text):
            return parseComputeInstruction(text: text)
        }
    }
    
    private func parseAddressInstruction(text: String) -> String {
        guard let atMarkIndex = text.firstIndex(of: "@") else {
            fatalError("@ is not found.")
        }
        
        let afterAtMarkIndex = text.index(after: atMarkIndex)
        let afterAtMarkText: String = String(text[afterAtMarkIndex...])
        if let num = Int(afterAtMarkText) {
            // @ + {number}
            return convertTo16DigitBinary(from: num)
        } else if let symbol = builtInSymbol[afterAtMarkText] {
            return convertTo16DigitBinary(from: symbol)
        }
        else if let symbol = labelSymbolTable[afterAtMarkText] {
            // @ + {label symbol}
            return convertTo16DigitBinary(from: symbol)
        } else if let symbol = variableSymbolTable[afterAtMarkText] {
            // @ + {variable symbol}
            return convertTo16DigitBinary(from: symbol)
        } else {
            // @ + {new symbol}
            let value = variableSymbolTable.count + 16
            variableSymbolTable[afterAtMarkText] = value
            return convertTo16DigitBinary(from: value)
        }
    }
    
    private func parseComputeInstruction(text: String) -> String {
        let text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let prefix = "111"
        
        var dest = ""
        var comp = ""
        var jump = ""
        
        // Parse dest, comp and jump
        if let equalIndex = text.firstIndex(of: "=") {
            // dest=comp(;jump)
            
            // dest
            let destPart = String(text[..<equalIndex])
            dest = parseComputeDest(text: destPart)
            
            let afterEqualIndex = text.index(after: equalIndex)
            if let semicolonIndex = text.firstIndex(of: ";") {
                // comp
                let compPart = String(text[afterEqualIndex..<semicolonIndex])
                comp = parseComputeComp(text: compPart)
                
                // jump
                let afterSemicolonIndex = text.index(before: semicolonIndex)
                let jumpPart = String(text[afterSemicolonIndex...])
                jump = parseComputeJump(text: jumpPart)
            } else {
                // comp
                let compPart = String(text[afterEqualIndex...])
                comp = parseComputeComp(text: compPart)
                
                // jump
                jump = parseComputeJump(text: "")
            }
        } else {
            // comp(;jump)
            
            // dest
            dest = parseComputeDest(text: "")
            
            if let semicolonIndex = text.firstIndex(of: ";") {
                // comp
                let compPart = String(text[..<semicolonIndex])
                comp = parseComputeComp(text: compPart)
                
                // jump
                let afterSemicolonIndex = text.index(after: semicolonIndex)
                let jumpPart = String(text[afterSemicolonIndex...])
                jump = parseComputeJump(text: jumpPart)
            } else {
                // comp
                comp = parseComputeComp(text: text)
                
                // jump
                jump = parseComputeJump(text: "")
            }
        }
        
        return prefix + comp + dest + jump
    }
    
    private func parseComputeDest(text: String) -> String {
        let destMnemonic = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        switch destMnemonic {
        case "":
            return "000"
        case "M":
            return "001"
        case "D":
            return "010"
        case "MD":
            return "011"
        case "A":
            return "100"
        case "AM":
            return "101"
        case "AD":
            return "110"
        case "AMD":
            return "111"
        default:
            fatalError("\"\(destMnemonic)\" is not valid destination mnemonic")
        }
    }
    
    private func parseComputeComp(text: String) -> String {
        let compMnemonic = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let comp: String
        switch compMnemonic {
        case "0" :
            comp = "101010"
        case "1" :
            comp = "111111"
        case "-1" :
            comp = "111010"
        case "D" :
            comp = "001100"
        case "A", "M" :
            comp = "110000"
        case "!D" :
            comp = "001101"
        case "!A", "!M" :
            comp = "110001"
        case "-D" :
            comp = "001111"
        case "-A", "-M" :
            comp = "110011"
        case "D+1" :
            comp = "011111"
        case "A+1", "M+1" :
            comp = "110111"
        case "D-1" :
            comp = "001110"
        case "A-1", "M-1" :
            comp = "110010"
        case "D+A", "D+M" :
            comp = "000010"
        case "D-A", "D-M" :
            comp = "010011"
        case "A-D", "M-D" :
            comp = "000111"
        case "D&A", "D&M" :
            comp = "000000"
        case "D|A", "D|M" :
            comp = "010101"
        default:
            fatalError("\(compMnemonic) is not valid destination mnemonic")
        }
        return (compMnemonic.contains("M") ? "1" : "0") + comp
    }
    
    private func parseComputeJump(text: String) -> String {
        let jumpMnemonic = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        switch jumpMnemonic {
        case "":
            return "000"
        case "JGT":
            return "001"
        case "JEQ":
            return "010"
        case "JGE":
            return "011"
        case "JLT":
            return "100"
        case "JNE":
            return "101"
        case "JLE":
            return "110"
        case "JMP":
            return "111"
        default:
            fatalError("\(jumpMnemonic) is not valid destination mnemonic")
        }
    }
}
