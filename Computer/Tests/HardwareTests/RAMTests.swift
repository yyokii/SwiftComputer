//
//  RAMTests.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/05.
//

import XCTest
@testable import Hardware

final class RAMTests: XCTestCase {
    
    func testRAM8_WhenInputIsAllZeroOrAllOne() {
        #warning("他のアドレスもテストする")
        let address: Bit3 = .init((.init(false), .init(false), .init(false)))
        
        XCTContext.runActivity(named: "input(t-1): allZero") { _ in
            XCTContext.runActivity(named: "load(t-1): 0") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram8 = RAM8()
                    _ =            ram8.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram8.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram8 = RAM8()
                    _ =            ram8.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram8.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram8 = RAM8()
                    _ =            ram8.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram8.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram8 = RAM8()
                    _ =            ram8.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram8.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allZero)
                }
            }
            
            XCTContext.runActivity(named: "load(t-1): 1") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram8 = RAM8()
                    _ =            ram8.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram8.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram8 = RAM8()
                    _ =            ram8.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram8.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram8 = RAM8()
                    _ =            ram8.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram8.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram8 = RAM8()
                    _ =            ram8.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram8.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allZero)
                }
            }
        }
        
        XCTContext.runActivity(named: "input(t-1): allOne") { _ in
            XCTContext.runActivity(named: "load(t-1): 0") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram8 = RAM8()
                    _ =            ram8.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram8.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram8 = RAM8()
                    _ =            ram8.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram8.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram8 = RAM8()
                    _ =            ram8.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram8.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram8 = RAM8()
                    _ =            ram8.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram8.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allZero)
                }
            }
            
            XCTContext.runActivity(named: "load(t-1): 1") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram8 = RAM8()
                    _ =            ram8.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram8.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allOne)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram8 = RAM8()
                    _ =            ram8.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram8.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allOne)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram8 = RAM8()
                    _ =            ram8.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram8.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allOne)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram8 = RAM8()
                    _ =            ram8.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram8.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allOne)
                }
            }
            
        }
    }
    
    func testRAM64_WhenInputIsAllZeroOrAllOne() {
        
        let address: Bit6 = .init((.init(false), .init(false), .init(false),
                                   .init(false), .init(false), .init(false)))
        
        XCTContext.runActivity(named: "input(t-1): allZero") { _ in
            XCTContext.runActivity(named: "load(t-1): 0") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram64 = RAM64()
                    _ =            ram64.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram64.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram64 = RAM64()
                    _ =            ram64.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram64.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram64 = RAM64()
                    _ =            ram64.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram64.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram64 = RAM64()
                    _ =            ram64.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram64.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allZero)
                }
            }
            
            XCTContext.runActivity(named: "load(t-1): 1") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram64 = RAM64()
                    _ =            ram64.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram64.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram64 = RAM64()
                    _ =            ram64.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram64.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram64 = RAM64()
                    _ =            ram64.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram64.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram64 = RAM64()
                    _ =            ram64.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram64.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allZero)
                }
            }
        }
        
        XCTContext.runActivity(named: "input(t-1): allOne") { _ in
            XCTContext.runActivity(named: "load(t-1): 0") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram64 = RAM64()
                    _ =            ram64.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram64.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram64 = RAM64()
                    _ =            ram64.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram64.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram64 = RAM64()
                    _ =            ram64.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram64.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram64 = RAM64()
                    _ =            ram64.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram64.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allZero)
                }
            }
            
            XCTContext.runActivity(named: "load(t-1): 1") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram64 = RAM64()
                    _ =            ram64.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram64.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allOne)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram64 = RAM64()
                    _ =            ram64.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram64.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allOne)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram64 = RAM64()
                    _ =            ram64.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram64.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allOne)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram64 = RAM64()
                    _ =            ram64.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram64.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allOne)
                }
            }
            
        }
    }
    
    func testRAM512_WhenInputIsAllZeroOrAllOne() {
        
        let address: Bit9 = .init((.init(false), .init(false), .init(false),
                                    .init(false), .init(false), .init(false),
                                    .init(false), .init(false), .init(false)))
        
        XCTContext.runActivity(named: "input(t-1): allZero") { _ in
            XCTContext.runActivity(named: "load(t-1): 0") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram512 = RAM512()
                    _ =            ram512.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram512.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram512 = RAM512()
                    _ =            ram512.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram512.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram512 = RAM512()
                    _ =            ram512.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram512.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram512 = RAM512()
                    _ =            ram512.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram512.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allZero)
                }
            }
            
            XCTContext.runActivity(named: "load(t-1): 1") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram512 = RAM512()
                    _ =            ram512.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram512.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram512 = RAM512()
                    _ =            ram512.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram512.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram512 = RAM512()
                    _ =            ram512.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram512.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram512 = RAM512()
                    _ =            ram512.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram512.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allZero)
                }
            }
        }
        
        XCTContext.runActivity(named: "input(t-1): allOne") { _ in
            XCTContext.runActivity(named: "load(t-1): 0") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram512 = RAM512()
                    _ =            ram512.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram512.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram512 = RAM512()
                    _ =            ram512.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram512.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram512 = RAM512()
                    _ =            ram512.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram512.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram512 = RAM512()
                    _ =            ram512.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram512.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allZero)
                }
            }
            
            XCTContext.runActivity(named: "load(t-1): 1") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram512 = RAM512()
                    _ =            ram512.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram512.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allOne)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram512 = RAM512()
                    _ =            ram512.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram512.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allOne)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram512 = RAM512()
                    _ =            ram512.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram512.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allOne)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram512 = RAM512()
                    _ =            ram512.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram512.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allOne)
                }
            }
            
        }
    }
    
    func testRAM4K_WhenInputIsAllZeroOrAllOne() {
        
        let address: Bit12 = .init((.init(false), .init(false), .init(false),
                                    .init(false), .init(false), .init(false),
                                    .init(false), .init(false), .init(false),
                                    .init(false), .init(false), .init(false)))
        
        XCTContext.runActivity(named: "input(t-1): allZero") { _ in
            XCTContext.runActivity(named: "load(t-1): 0") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram4K = RAM4K()
                    _ =            ram4K.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram4K.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram4K = RAM4K()
                    _ =            ram4K.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram4K.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram4K = RAM4K()
                    _ =            ram4K.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram4K.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram4K = RAM4K()
                    _ =            ram4K.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram4K.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allZero)
                }
            }
            
            XCTContext.runActivity(named: "load(t-1): 1") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram4K = RAM4K()
                    _ =            ram4K.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram4K.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram4K = RAM4K()
                    _ =            ram4K.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram4K.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram4K = RAM4K()
                    _ =            ram4K.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram4K.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram4K = RAM4K()
                    _ =            ram4K.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram4K.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allZero)
                }
            }
        }
        
        XCTContext.runActivity(named: "input(t-1): allOne") { _ in
            XCTContext.runActivity(named: "load(t-1): 0") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram4K = RAM4K()
                    _ =            ram4K.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram4K.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram4K = RAM4K()
                    _ =            ram4K.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram4K.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram4K = RAM4K()
                    _ =            ram4K.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram4K.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram4K = RAM4K()
                    _ =            ram4K.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram4K.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allZero)
                }
            }
            
            XCTContext.runActivity(named: "load(t-1): 1") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram4K = RAM4K()
                    _ =            ram4K.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram4K.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allOne)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram4K = RAM4K()
                    _ =            ram4K.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram4K.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allOne)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram4K = RAM4K()
                    _ =            ram4K.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram4K.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allOne)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram4K = RAM4K()
                    _ =            ram4K.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram4K.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allOne)
                }
            }
            
        }
    }

    func testRAM16K_WhenInputIsAllZeroOrAllOne() {
        
        let address: Bit14 = .init((.init(false), .init(false), .init(false),
                                    .init(false), .init(false), .init(false),
                                    .init(false), .init(false), .init(false),
                                    .init(false), .init(false),.init(false),
                                    .init(false), .init(false)))
        
        XCTContext.runActivity(named: "input(t-1): allZero") { _ in
            XCTContext.runActivity(named: "load(t-1): 0") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram16K = RAM16K()
                    _ =            ram16K.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram16K.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram16K = RAM16K()
                    _ =            ram16K.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram16K.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram16K = RAM16K()
                    _ =            ram16K.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram16K.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram16K = RAM16K()
                    _ =            ram16K.out(in: Bit16.allZero, address: address, load: .init(false))
                    XCTAssertEqual(ram16K.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allZero)
                }
            }
            
            XCTContext.runActivity(named: "load(t-1): 1") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram16K = RAM16K()
                    _ =            ram16K.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram16K.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram16K = RAM16K()
                    _ =            ram16K.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram16K.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram16K = RAM16K()
                    _ =            ram16K.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram16K.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram16K = RAM16K()
                    _ =            ram16K.out(in: Bit16.allZero, address: address, load: .init(true))
                    XCTAssertEqual(ram16K.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allZero)
                }
            }
        }
        
        XCTContext.runActivity(named: "input(t-1): allOne") { _ in
            XCTContext.runActivity(named: "load(t-1): 0") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram16K = RAM16K()
                    _ =            ram16K.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram16K.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram16K = RAM16K()
                    _ =            ram16K.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram16K.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram16K = RAM16K()
                    _ =            ram16K.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram16K.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allZero)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram16K = RAM16K()
                    _ =            ram16K.out(in: Bit16.allOne, address: address, load: .init(false))
                    XCTAssertEqual(ram16K.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allZero)
                }
            }
            
            XCTContext.runActivity(named: "load(t-1): 1") { _ in
                XCTContext.runActivity(named: "input(t): 0, load(t): 0") { _ in
                    let ram16K = RAM16K()
                    _ =            ram16K.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram16K.out(in: Bit16.allZero, address: address, load: .init(false)), Bit16.allOne)
                }
                
                XCTContext.runActivity(named: "input(t): 0, load(t): 1") { _ in
                    let ram16K = RAM16K()
                    _ =            ram16K.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram16K.out(in: Bit16.allZero, address: address, load: .init(true)), Bit16.allOne)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 0") { _ in
                    let ram16K = RAM16K()
                    _ =            ram16K.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram16K.out(in: Bit16.allOne, address: address, load: .init(false)), Bit16.allOne)
                }
                
                XCTContext.runActivity(named: "input(t): 1, load(t): 1") { _ in
                    let ram16K = RAM16K()
                    _ =            ram16K.out(in: Bit16.allOne, address: address, load: .init(true))
                    XCTAssertEqual(ram16K.out(in: Bit16.allOne, address: address, load: .init(true)), Bit16.allOne)
                }
            }
            
        }
    }

}
