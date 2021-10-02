//
//  MultiGate.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/01.
//


public func not16(a: [Bool]) -> [Bool] {
    [
        not(a: a[0]),
        not(a: a[1]),
        not(a: a[2]),
        not(a: a[3]),
        not(a: a[4]),
        not(a: a[5]),
        not(a: a[6]),
        not(a: a[7]),
        not(a: a[8]),
        not(a: a[9]),
        not(a: a[10]),
        not(a: a[11]),
        not(a: a[12]),
        not(a: a[13]),
        not(a: a[14]),
        not(a: a[15])
    ]
}

public func and16(a: [Bool], b: [Bool]) -> [Bool] {
    [
        and(a: a[0], b: b[0]),
        and(a: a[1], b: b[1]),
        and(a: a[2], b: b[2]),
        and(a: a[3], b: b[3]),
        and(a: a[4], b: b[4]),
        and(a: a[5], b: b[5]),
        and(a: a[6], b: b[6]),
        and(a: a[7], b: b[7]),
        and(a: a[8], b: b[8]),
        and(a: a[9], b: b[9]),
        and(a: a[10], b: b[10]),
        and(a: a[11], b: b[11]),
        and(a: a[12], b: b[12]),
        and(a: a[13], b: b[13]),
        and(a: a[14], b: b[14]),
        and(a: a[15], b: b[15])
    ]
}

public func or16(a: [Bool], b: [Bool]) -> [Bool] {
    [
        or(a: a[0], b: b[0]),
        or(a: a[1], b: b[1]),
        or(a: a[2], b: b[2]),
        or(a: a[3], b: b[3]),
        or(a: a[4], b: b[4]),
        or(a: a[5], b: b[5]),
        or(a: a[6], b: b[6]),
        or(a: a[7], b: b[7]),
        or(a: a[8], b: b[8]),
        or(a: a[9], b: b[9]),
        or(a: a[10], b: b[10]),
        or(a: a[11], b: b[11]),
        or(a: a[12], b: b[12]),
        or(a: a[13], b: b[13]),
        or(a: a[14], b: b[14]),
        or(a: a[15], b: b[15])
    ]
}

public func mux16(a: [Bool], b: [Bool], sel: Bool) -> [Bool] {
    [
        mux(a: a[0], b: b[0], sel: sel),
        mux(a: a[1], b: b[1], sel: sel),
        mux(a: a[2], b: b[2], sel: sel),
        mux(a: a[3], b: b[3], sel: sel),
        mux(a: a[4], b: b[4], sel: sel),
        mux(a: a[5], b: b[5], sel: sel),
        mux(a: a[6], b: b[6], sel: sel),
        mux(a: a[7], b: b[7], sel: sel),
        mux(a: a[8], b: b[8], sel: sel),
        mux(a: a[9], b: b[9], sel: sel),
        mux(a: a[10], b: b[10], sel: sel),
        mux(a: a[11], b: b[11], sel: sel),
        mux(a: a[12], b: b[12], sel: sel),
        mux(a: a[13], b: b[13], sel: sel),
        mux(a: a[14], b: b[14], sel: sel),
        mux(a: a[15], b: b[15], sel: sel)
    ]
}

public func or8way(a: [Bool]) -> Bool {
    or(a: or(a: or(a: a[0], b: a[1]),
             b: or(a: a[2], b: a[3])),
       b: or(a: or(a: a[4], b: a[5]),
             b: or(a: a[6], b: a[7])))
}

public func mux4(a: Bool,
                 b: Bool,
                 c: Bool,
                 d: Bool,
                 sel: [Bool]) -> Bool {
    mux(a: mux(a: a, b: b, sel: sel[1]),
        b: mux(a: c, b: d, sel: sel[1]),
        sel: sel[0])
}

public func mux8(a: Bool,
                 b: Bool,
                 c: Bool,
                 d: Bool,
                 e: Bool,
                 f: Bool,
                 g: Bool,
                 h: Bool,
                 sel: [Bool]) -> Bool {
    mux(a: mux(a: mux(a: a, b: b, sel: sel[2]),
               b: mux(a: c, b: d, sel: sel[2]),
               sel: sel[1]),
        b: mux(a: mux(a: e, b: f, sel: sel[2]),
               b: mux(a: g, b: h, sel: sel[2]),
               sel: sel[1]),
        sel: sel[0])
    
}

public func mux4Way16(a: [Bool],
                      b: [Bool],
                      c: [Bool],
                      d: [Bool],
                      sel: [Bool]) -> [Bool] {
    [
        mux4(a: a[0], b: b[0], c: c[0], d: d[0], sel: sel),
        mux4(a: a[1], b: b[1], c: c[1], d: d[1], sel: sel),
        mux4(a: a[2], b: b[2], c: c[2], d: d[2], sel: sel),
        mux4(a: a[3], b: b[3], c: c[3], d: d[3], sel: sel),
        mux4(a: a[4], b: b[4], c: c[4], d: d[4], sel: sel),
        mux4(a: a[5], b: b[5], c: c[5], d: d[5], sel: sel),
        mux4(a: a[6], b: b[6], c: c[6], d: d[6], sel: sel),
        mux4(a: a[7], b: b[7], c: c[7], d: d[7], sel: sel),
        mux4(a: a[8], b: b[8], c: c[8], d: d[8], sel: sel),
        mux4(a: a[9], b: b[9], c: c[9], d: d[9], sel: sel),
        mux4(a: a[10], b: b[10], c: c[10], d: d[10], sel: sel),
        mux4(a: a[11], b: b[11], c: c[11], d: d[11], sel: sel),
        mux4(a: a[12], b: b[12], c: c[12], d: d[12], sel: sel),
        mux4(a: a[13], b: b[13], c: c[13], d: d[13], sel: sel),
        mux4(a: a[14], b: b[14], c: c[14], d: d[14], sel: sel),
        mux4(a: a[15], b: b[15], c: c[15], d: d[15], sel: sel)
    ]
}

public func mux8Way16(a: [Bool],
                      b: [Bool],
                      c: [Bool],
                      d: [Bool],
                      e: [Bool],
                      f: [Bool],
                      g: [Bool],
                      h: [Bool],
                      sel: [Bool]) -> [Bool] {
    [
        mux8(a: a[0], b: b[0], c: c[0], d: d[0], e: e[0], f: f[0], g: g[0], h: h[0], sel: sel),
        mux8(a: a[1], b: b[1], c: c[1], d: d[1], e: e[1], f: f[1], g: g[1], h: h[1], sel: sel),
        mux8(a: a[2], b: b[2], c: c[2], d: d[2], e: e[2], f: f[2], g: g[2], h: h[2], sel: sel),
        mux8(a: a[3], b: b[3], c: c[3], d: d[3], e: e[3], f: f[3], g: g[3], h: h[3], sel: sel),
        mux8(a: a[4], b: b[4], c: c[4], d: d[4], e: e[4], f: f[4], g: g[4], h: h[4], sel: sel),
        mux8(a: a[5], b: b[5], c: c[5], d: d[5], e: e[5], f: f[5], g: g[5], h: h[5], sel: sel),
        mux8(a: a[6], b: b[6], c: c[6], d: d[6], e: e[6], f: f[6], g: g[6], h: h[6], sel: sel),
        mux8(a: a[7], b: b[7], c: c[7], d: d[7], e: e[7], f: f[7], g: g[7], h: h[7], sel: sel),
        mux8(a: a[8], b: b[8], c: c[8], d: d[8], e: e[8], f: f[8], g: g[8], h: h[8], sel: sel),
        mux8(a: a[9], b: b[9], c: c[9], d: d[9], e: e[9], f: f[9], g: g[9], h: h[9], sel: sel),
        mux8(a: a[10], b: b[10], c: c[10], d: d[10], e: e[10], f: f[10], g: g[10], h: h[10], sel: sel),
        mux8(a: a[11], b: b[11], c: c[11], d: d[11], e: e[11], f: f[11], g: g[11], h: h[11], sel: sel),
        mux8(a: a[12], b: b[12], c: c[12], d: d[12], e: e[12], f: f[12], g: g[12], h: h[12], sel: sel),
        mux8(a: a[13], b: b[13], c: c[13], d: d[13], e: e[13], f: f[13], g: g[13], h: h[13], sel: sel),
        mux8(a: a[14], b: b[14], c: c[14], d: d[14], e: e[14], f: f[14], g: g[14], h: h[14], sel: sel),
        mux8(a: a[15], b: b[15], c: c[15], d: d[15], e: e[15], f: f[15], g: g[15], h: h[15], sel: sel)
    ]
}

public func dmux4way(a: Bool, sel: [Bool]) -> [Bool] {
    [
        and(a: and(a: not(a: sel[0]), b: not(a: sel[1])), b: a),
        and(a: and(a: not(a: sel[0]), b: sel[1]), b: a),
        and(a: and(a: sel[0], b: not(a: sel[1])), b: a),
        and(a: and(a: sel[0], b: sel[1]), b: a),
    ]
}

public func dmux8way(a: Bool, sel: [Bool]) -> [Bool] {
    [
        and(a: and(a: not(a: sel[0]),
                   b: and(a: not(a: sel[1]), b: not(a: sel[2]))),
            b: a),
        and(a: and(a: not(a: sel[0]),
                   b: and(a: not(a: sel[1]), b: sel[2])),
            b: a),
        and(a: and(a: not(a: sel[0]),
                   b: and(a: sel[1], b: not(a: sel[2]))),
            b: a),
        and(a: and(a: not(a: sel[0]),
                   b: and(a: sel[1], b: sel[2])),
            b: a),
        and(a: and(a: sel[0],
                   b: and(a: not(a: sel[1]), b: not(a: sel[2]))),
            b: a),
        and(a: and(a: sel[0],
                   b: and(a: not(a: sel[1]), b: sel[2])),
            b: a),
        and(a: and(a: sel[0],
                   b: and(a: sel[1], b: not(a: sel[2]))),
            b: a),
        and(a: and(a: sel[0],
                   b: and(a: sel[1], b: sel[2])),
            b: a)
    ]
}


