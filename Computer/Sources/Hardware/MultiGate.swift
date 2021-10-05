//
//  MultiGate.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/01.
//

#warning("naming Gate16 is more correct?")

public struct MultiGate {
    public static func not16(a: Bit16) -> Bit16 {
        .init((Gate.not(a: a.values.0),
               Gate.not(a: a.values.1),
               Gate.not(a: a.values.2),
               Gate.not(a: a.values.3),
               Gate.not(a: a.values.4),
               Gate.not(a: a.values.5),
               Gate.not(a: a.values.6),
               Gate.not(a: a.values.7),
               Gate.not(a: a.values.8),
               Gate.not(a: a.values.9),
               Gate.not(a: a.values.10),
               Gate.not(a: a.values.11),
               Gate.not(a: a.values.12),
               Gate.not(a: a.values.13),
               Gate.not(a: a.values.14),
               Gate.not(a: a.values.15)))
    }
    
    public static func and16(a: Bit16, b: Bit16) -> Bit16 {
        .init((Gate.and(a: a.values.0, b: b.values.0),
               Gate.and(a: a.values.1, b: b.values.1),
               Gate.and(a: a.values.2, b: b.values.2),
               Gate.and(a: a.values.3, b: b.values.3),
               Gate.and(a: a.values.4, b: b.values.4),
               Gate.and(a: a.values.5, b: b.values.5),
               Gate.and(a: a.values.6, b: b.values.6),
               Gate.and(a: a.values.7, b: b.values.7),
               Gate.and(a: a.values.8, b: b.values.8),
               Gate.and(a: a.values.9, b: b.values.9),
               Gate.and(a: a.values.10, b: b.values.10),
               Gate.and(a: a.values.11, b: b.values.11),
               Gate.and(a: a.values.12, b: b.values.12),
               Gate.and(a: a.values.13, b: b.values.13),
               Gate.and(a: a.values.14, b: b.values.14),
               Gate.and(a: a.values.15, b: b.values.15)))
        
    }
    
    public static func or16(a: Bit16, b: Bit16) -> Bit16 {
        .init((Gate.or(a: a.values.0, b: b.values.0),
               Gate.or(a: a.values.1, b: b.values.1),
               Gate.or(a: a.values.2, b: b.values.2),
               Gate.or(a: a.values.3, b: b.values.3),
               Gate.or(a: a.values.4, b: b.values.4),
               Gate.or(a: a.values.5, b: b.values.5),
               Gate.or(a: a.values.6, b: b.values.6),
               Gate.or(a: a.values.7, b: b.values.7),
               Gate.or(a: a.values.8, b: b.values.8),
               Gate.or(a: a.values.9, b: b.values.9),
               Gate.or(a: a.values.10, b: b.values.10),
               Gate.or(a: a.values.11, b: b.values.11),
               Gate.or(a: a.values.12, b: b.values.12),
               Gate.or(a: a.values.13, b: b.values.13),
               Gate.or(a: a.values.14, b: b.values.14),
               Gate.or(a: a.values.15, b: b.values.15)))
    }
    
    public static func mux16(a: Bit16, b: Bit16, sel: Bit) -> Bit16 {
        .init((Gate.mux(a: a.values.0, b: b.values.0, sel: sel),
               Gate.mux(a: a.values.1, b: b.values.1, sel: sel),
               Gate.mux(a: a.values.2, b: b.values.2, sel: sel),
               Gate.mux(a: a.values.3, b: b.values.3, sel: sel),
               Gate.mux(a: a.values.4, b: b.values.4, sel: sel),
               Gate.mux(a: a.values.5, b: b.values.5, sel: sel),
               Gate.mux(a: a.values.6, b: b.values.6, sel: sel),
               Gate.mux(a: a.values.7, b: b.values.7, sel: sel),
               Gate.mux(a: a.values.8, b: b.values.8, sel: sel),
               Gate.mux(a: a.values.9, b: b.values.9, sel: sel),
               Gate.mux(a: a.values.10, b: b.values.10, sel: sel),
               Gate.mux(a: a.values.11, b: b.values.11, sel: sel),
               Gate.mux(a: a.values.12, b: b.values.12, sel: sel),
               Gate.mux(a: a.values.13, b: b.values.13, sel: sel),
               Gate.mux(a: a.values.14, b: b.values.14, sel: sel),
               Gate.mux(a: a.values.15, b: b.values.15, sel: sel)))
    }
    
    public static func or8way(a: Bit8) -> Bit {
        Gate.or(a: Gate.or(a: Gate.or(a: a.values.0, b: a.values.1),
                           b: Gate.or(a: a.values.2, b: a.values.3)),
                b: Gate.or(a: Gate.or(a: a.values.4, b: a.values.5),
                           b: Gate.or(a: a.values.6, b: a.values.7)))
    }
    
    public static func mux4(a: Bit,
                            b: Bit,
                            c: Bit,
                            d: Bit,
                            sel: Bit2) -> Bit {
        Gate.mux(a: Gate.mux(a: a, b: b, sel: sel.values.1),
                 b: Gate.mux(a: c, b: d, sel: sel.values.1),
                 sel: sel.values.0)
    }
    
    public static func mux8(a: Bit,
                            b: Bit,
                            c: Bit,
                            d: Bit,
                            e: Bit,
                            f: Bit,
                            g: Bit,
                            h: Bit,
                            sel: Bit3) -> Bit {
        Gate.mux(a: Gate.mux(a: Gate.mux(a: a, b: b, sel: sel.values.2),
                             b: Gate.mux(a: c, b: d, sel: sel.values.2),
                             sel: sel.values.1),
                 b: Gate.mux(a: Gate.mux(a: e, b: f, sel: sel.values.2),
                             b: Gate.mux(a: g, b: h, sel: sel.values.2),
                             sel: sel.values.1),
                 sel: sel.values.0)
        
    }
    
    public static func mux4Way16(a: Bit16,
                                 b: Bit16,
                                 c: Bit16,
                                 d: Bit16,
                                 sel: Bit2) -> Bit16 {
        .init((mux4(a: a.values.0, b: b.values.0, c: c.values.0, d: d.values.0, sel: sel),
               mux4(a: a.values.1, b: b.values.1, c: c.values.1, d: d.values.1, sel: sel),
               mux4(a: a.values.2, b: b.values.2, c: c.values.2, d: d.values.2, sel: sel),
               mux4(a: a.values.3, b: b.values.3, c: c.values.3, d: d.values.3, sel: sel),
               mux4(a: a.values.4, b: b.values.4, c: c.values.4, d: d.values.4, sel: sel),
               mux4(a: a.values.5, b: b.values.5, c: c.values.5, d: d.values.5, sel: sel),
               mux4(a: a.values.6, b: b.values.6, c: c.values.6, d: d.values.6, sel: sel),
               mux4(a: a.values.7, b: b.values.7, c: c.values.7, d: d.values.7, sel: sel),
               mux4(a: a.values.8, b: b.values.8, c: c.values.8, d: d.values.8, sel: sel),
               mux4(a: a.values.9, b: b.values.9, c: c.values.9, d: d.values.9, sel: sel),
               mux4(a: a.values.10, b: b.values.10, c: c.values.10, d: d.values.10, sel: sel),
               mux4(a: a.values.11, b: b.values.11, c: c.values.11, d: d.values.11, sel: sel),
               mux4(a: a.values.12, b: b.values.12, c: c.values.12, d: d.values.12, sel: sel),
               mux4(a: a.values.13, b: b.values.13, c: c.values.13, d: d.values.13, sel: sel),
               mux4(a: a.values.14, b: b.values.14, c: c.values.14, d: d.values.14, sel: sel),
               mux4(a: a.values.15, b: b.values.15, c: c.values.15, d: d.values.15, sel: sel)))
    }
    
    public static func mux8Way16(a: Bit16,
                                 b: Bit16,
                                 c: Bit16,
                                 d: Bit16,
                                 e: Bit16,
                                 f: Bit16,
                                 g: Bit16,
                                 h: Bit16,
                                 sel: Bit3) -> Bit16 {
        .init((mux8(a: a.values.0, b: b.values.0, c: c.values.0, d: d.values.0, e: e.values.0, f: f.values.0, g: g.values.0, h: h.values.0, sel: sel),
               mux8(a: a.values.1, b: b.values.1, c: c.values.1, d: d.values.1, e: e.values.1, f: f.values.1, g: g.values.1, h: h.values.1, sel: sel),
               mux8(a: a.values.2, b: b.values.2, c: c.values.2, d: d.values.2, e: e.values.2, f: f.values.2, g: g.values.2, h: h.values.2, sel: sel),
               mux8(a: a.values.3, b: b.values.3, c: c.values.3, d: d.values.3, e: e.values.3, f: f.values.3, g: g.values.3, h: h.values.3, sel: sel),
               mux8(a: a.values.4, b: b.values.4, c: c.values.4, d: d.values.4, e: e.values.4, f: f.values.4, g: g.values.4, h: h.values.4, sel: sel),
               mux8(a: a.values.5, b: b.values.5, c: c.values.5, d: d.values.5, e: e.values.5, f: f.values.5, g: g.values.5, h: h.values.5, sel: sel),
               mux8(a: a.values.6, b: b.values.6, c: c.values.6, d: d.values.6, e: e.values.6, f: f.values.6, g: g.values.6, h: h.values.6, sel: sel),
               mux8(a: a.values.7, b: b.values.7, c: c.values.7, d: d.values.7, e: e.values.7, f: f.values.7, g: g.values.7, h: h.values.7, sel: sel),
               mux8(a: a.values.8, b: b.values.8, c: c.values.8, d: d.values.8, e: e.values.8, f: f.values.8, g: g.values.8, h: h.values.8, sel: sel),
               mux8(a: a.values.9, b: b.values.9, c: c.values.9, d: d.values.9, e: e.values.9, f: f.values.9, g: g.values.9, h: h.values.9, sel: sel),
               mux8(a: a.values.10, b: b.values.10, c: c.values.10, d: d.values.10, e: e.values.10, f: f.values.10, g: g.values.10, h: h.values.10, sel: sel),
               mux8(a: a.values.11, b: b.values.11, c: c.values.11, d: d.values.11, e: e.values.11, f: f.values.11, g: g.values.11, h: h.values.11, sel: sel),
               mux8(a: a.values.12, b: b.values.12, c: c.values.12, d: d.values.12, e: e.values.12, f: f.values.12, g: g.values.12, h: h.values.12, sel: sel),
               mux8(a: a.values.13, b: b.values.13, c: c.values.13, d: d.values.13, e: e.values.13, f: f.values.13, g: g.values.13, h: h.values.13, sel: sel),
               mux8(a: a.values.14, b: b.values.14, c: c.values.14, d: d.values.14, e: e.values.14, f: f.values.14, g: g.values.14, h: h.values.14, sel: sel),
               mux8(a: a.values.15, b: b.values.15, c: c.values.15, d: d.values.15, e: e.values.15, f: f.values.15, g: g.values.15, h: h.values.15, sel: sel)))
    }
    
    public static func dmux4way(a: Bit, sel: Bit2) -> Bit4 {
        .init((Gate.and(a: Gate.and(a: Gate.not(a: sel.values.0), b: Gate.not(a: sel.values.1)), b: a),
               Gate.and(a: Gate.and(a: Gate.not(a: sel.values.0), b: sel.values.1), b: a),
               Gate.and(a: Gate.and(a: sel.values.0, b: Gate.not(a: sel.values.1)), b: a),
               Gate.and(a: Gate.and(a: sel.values.0, b: sel.values.1), b: a)))
    }
    
    public static func dmux8way(a: Bit, sel: Bit3) -> Bit8 {
        .init((Gate.and(a: Gate.and(a: Gate.not(a: sel.values.0),
                                    b: Gate.and(a: Gate.not(a: sel.values.1), b: Gate.not(a: sel.values.2))),
                        b: a),
               Gate.and(a: Gate.and(a: Gate.not(a: sel.values.0),
                                    b: Gate.and(a: Gate.not(a: sel.values.1), b: sel.values.2)),
                        b: a),
               Gate.and(a: Gate.and(a: Gate.not(a: sel.values.0),
                                    b: Gate.and(a: sel.values.1, b: Gate.not(a: sel.values.2))),
                        b: a),
               Gate.and(a: Gate.and(a: Gate.not(a: sel.values.0),
                                    b: Gate.and(a: sel.values.1, b: sel.values.2)),
                        b: a),
               Gate.and(a: Gate.and(a: sel.values.0,
                                    b: Gate.and(a: Gate.not(a: sel.values.1), b: Gate.not(a: sel.values.2))),
                        b: a),
               Gate.and(a: Gate.and(a: sel.values.0,
                                    b: Gate.and(a: Gate.not(a: sel.values.1), b: sel.values.2)),
                        b: a),
               Gate.and(a: Gate.and(a: sel.values.0,
                                    b: Gate.and(a: sel.values.1, b: Gate.not(a: sel.values.2))),
                        b: a),
               Gate.and(a: Gate.and(a: sel.values.0,
                                    b: Gate.and(a: sel.values.1, b: sel.values.2)),
                        b: a)))
    }
}

