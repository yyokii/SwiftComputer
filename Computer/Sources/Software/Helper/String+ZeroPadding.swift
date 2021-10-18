//
//  String+ZeroPadding.swift
//  
//
//  Created by Higashihara Yoki on 2021/10/07.
//

extension String {
    func zeroPadding(toSize: Int) -> String {
        var padded = self
        for _ in 0..<(toSize - count) {
            padded = "0" + padded
        }
        return padded
    }
}
