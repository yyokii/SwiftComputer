//
//  RAM.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/03.
//

/// 8 16-bit registers
class RAM8 {
    private var registers: (Register16, Register16, Register16, Register16,
                            Register16, Register16, Register16, Register16) = (Register16(),Register16(),Register16(),Register16(),
                                                                               Register16(),Register16(),Register16(),Register16())
    
    func out(`in`: Bit16, address: Bit3, load: Bit) -> Bit16 {
        let loads: Bit8 = MultiGate.dmux8way(a: load, sel: address)
        
        return MultiGate.mux8Way16(a: registers.0.output(in: `in`, load: loads.values.0),
                                   b: registers.1.output(in: `in`, load: loads.values.1),
                                   c: registers.2.output(in: `in`, load: loads.values.2),
                                   d: registers.3.output(in: `in`, load: loads.values.3),
                                   e: registers.4.output(in: `in`, load: loads.values.4),
                                   f: registers.5.output(in: `in`, load: loads.values.5),
                                   g: registers.6.output(in: `in`, load: loads.values.6),
                                   h: registers.7.output(in: `in`, load: loads.values.7),
                                   sel: address)
    }
}

class RAM64 {
    private var ram8s: (RAM8, RAM8, RAM8, RAM8,
                        RAM8, RAM8, RAM8, RAM8) = (RAM8(),RAM8(),RAM8(),RAM8(),
                                                   RAM8(),RAM8(),RAM8(),RAM8())
    
        func out(`in`: Bit16, address: Bit6, load: Bit) -> Bit16 {
            // The upper 3 bits of the address are used to select the RAM8, and the lower 3 bits are used as the address of the RAM8.
    
            let upperAddress: Bit3 = .init((address.values.3, address.values.4, address.values.5))
            let lowerAddress: Bit3 = .init((address.values.0, address.values.1, address.values.2))
    
            let loads: Bit8 = MultiGate.dmux8way(a: load, sel: .init(upperAddress.values))
    
            return MultiGate.mux8Way16(a: ram8s.0.out(in: `in`, address: lowerAddress, load: loads.values.0),
                                       b: ram8s.1.out(in: `in`, address: lowerAddress, load: loads.values.1),
                                       c: ram8s.2.out(in: `in`, address: lowerAddress, load: loads.values.2),
                                       d: ram8s.3.out(in: `in`, address: lowerAddress, load: loads.values.3),
                                       e: ram8s.4.out(in: `in`, address: lowerAddress, load: loads.values.4),
                                       f: ram8s.5.out(in: `in`, address: lowerAddress, load: loads.values.5),
                                       g: ram8s.6.out(in: `in`, address: lowerAddress, load: loads.values.6),
                                       h: ram8s.7.out(in: `in`, address: lowerAddress, load: loads.values.7),
                                       sel: upperAddress)
        }
}

class RAM512 {
    private var ram64s: (RAM64, RAM64, RAM64, RAM64,
                        RAM64, RAM64, RAM64, RAM64) = (RAM64(),RAM64(),RAM64(),RAM64(),
                                                       RAM64(),RAM64(),RAM64(),RAM64())
    
        func out(`in`: Bit16, address: Bit9, load: Bit) -> Bit16 {
            let upperAddress: Bit3 = .init((address.values.6, address.values.7, address.values.8))
            let lowerAddress: Bit6 = .init((address.values.0, address.values.1, address.values.2,
                                            address.values.3, address.values.4, address.values.5))
    
            let loads: Bit8 = MultiGate.dmux8way(a: load, sel: .init(upperAddress.values))
    
            return MultiGate.mux8Way16(a: ram64s.0.out(in: `in`, address: lowerAddress, load: loads.values.0),
                                       b: ram64s.1.out(in: `in`, address: lowerAddress, load: loads.values.1),
                                       c: ram64s.2.out(in: `in`, address: lowerAddress, load: loads.values.2),
                                       d: ram64s.3.out(in: `in`, address: lowerAddress, load: loads.values.3),
                                       e: ram64s.4.out(in: `in`, address: lowerAddress, load: loads.values.4),
                                       f: ram64s.5.out(in: `in`, address: lowerAddress, load: loads.values.5),
                                       g: ram64s.6.out(in: `in`, address: lowerAddress, load: loads.values.6),
                                       h: ram64s.7.out(in: `in`, address: lowerAddress, load: loads.values.7),
                                       sel: upperAddress)
        }
}

class RAM4K {
    private var ram512s: (RAM512, RAM512, RAM512, RAM512,
                        RAM512, RAM512, RAM512, RAM512) = (RAM512(),RAM512(),RAM512(),RAM512(),
                                                           RAM512(),RAM512(),RAM512(),RAM512())

    func out(`in`: Bit16, address: Bit12, load: Bit) -> Bit16 {
        let upperAddress: Bit3 = .init((address.values.9, address.values.10, address.values.11))
        let lowerAddress: Bit9 = .init((address.values.0, address.values.1, address.values.2,
                                        address.values.3, address.values.4, address.values.5,
                                        address.values.6, address.values.7, address.values.8))

        let loads = MultiGate.dmux8way(a: load, sel: .init(upperAddress.values))

        return MultiGate.mux8Way16(a: ram512s.0.out(in: `in`, address: lowerAddress, load: loads.values.0),
                                   b: ram512s.1.out(in: `in`, address: lowerAddress, load: loads.values.1),
                                   c: ram512s.2.out(in: `in`, address: lowerAddress, load: loads.values.2),
                                   d: ram512s.3.out(in: `in`, address: lowerAddress, load: loads.values.3),
                                   e: ram512s.4.out(in: `in`, address: lowerAddress, load: loads.values.4),
                                   f: ram512s.5.out(in: `in`, address: lowerAddress, load: loads.values.5),
                                   g: ram512s.6.out(in: `in`, address: lowerAddress, load: loads.values.6),
                                   h: ram512s.7.out(in: `in`, address: lowerAddress, load: loads.values.7),
                                   sel: upperAddress)
    }
}

class RAM16K {
    private var ram4Ks: (RAM4K, RAM4K, RAM4K, RAM4K) = (RAM4K(), RAM4K(), RAM4K(), RAM4K())

    func out(`in`: Bit16, address: Bit14, load: Bit) -> Bit16 {
        let upperAddress: Bit2 = .init((address.values.12, address.values.13))
        let lowerAddress: Bit12 = .init((address.values.0, address.values.1, address.values.2,
                                         address.values.3, address.values.4, address.values.5,
                                         address.values.6, address.values.7, address.values.8,
                                         address.values.9, address.values.10, address.values.11))

        let loads = MultiGate.dmux4way(a: load, sel: .init(upperAddress.values))

        return MultiGate.mux4Way16(a: ram4Ks.0.out(in: `in`, address: lowerAddress, load: loads.values.0),
                                   b: ram4Ks.1.out(in: `in`, address: lowerAddress, load: loads.values.1),
                                   c: ram4Ks.2.out(in: `in`, address: lowerAddress, load: loads.values.2),
                                   d: ram4Ks.3.out(in: `in`, address: lowerAddress, load: loads.values.3),
                                   sel: upperAddress)
    }
}

class RAM32K {
    private var ram4Ks: (RAM16K, RAM16K) = (RAM16K(), RAM16K())

    func out(`in`: Bit16, address: Bit15, load: Bit) -> Bit16 {
        let upperAddress: Bit = address.values.14
        let lowerAddress: Bit14 = .init((address.values.0, address.values.1, address.values.2,
                                         address.values.3, address.values.4, address.values.5,
                                         address.values.6, address.values.7, address.values.8,
                                         address.values.9, address.values.10, address.values.11,
                                         address.values.12, address.values.13))

        let loads: Bit2 = Gate.dmux(a: load, sel: upperAddress)        
        
        return MultiGate.mux16(a: ram4Ks.0.out(in: `in`, address: lowerAddress, load: loads.values.0),
                               b: ram4Ks.1.out(in: `in`, address: lowerAddress, load: loads.values.1),
                               sel: upperAddress)
    }
}

