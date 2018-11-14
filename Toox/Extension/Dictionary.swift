//
//  Dictionary.swift
//  Toox
//
//  Created by 门捷夫 on 2018/10/26.
//  Copyright © 2018 门捷夫. All rights reserved.
//

import Foundation

extension Dictionary {
    /// Dictionary Addition
    ///
    /// - Parameters:
    ///   - lhs: left-hand side
    ///   - rhs: right-hand side
    /// - Returns: result dictionary
    public static func + (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        var result: [Key: Value] = lhs
        rhs.forEach { result[$0] = $1 }
        return result
    }

    /// Dictionary Subtraction
    ///
    /// - Parameters:
    ///   - lhs: left-hand side
    ///   - rhs: right-hand side
    /// - Returns: result dictionary
    public static func - (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        var result: [Key: Value] = lhs
        rhs.keys.forEach { result.removeValue(forKey: $0) }
        return result
    }

    /// Compound Assignment Operators - Addition
    ///
    /// - Parameters:
    ///   - lhs: left-hand side
    ///   - rhs: right-hand side
    public static func += (lhs: inout [Key: Value], rhs: [Key: Value]) {
        lhs = lhs + rhs
    }

    /// Compound Assignment Operators - Subtraction
    ///
    /// - Parameters:
    ///   - lhs: left-hand side
    ///   - rhs: right-hand side
    public static func -= (lhs: inout [Key: Value], rhs: [Key: Value]) {
        lhs = lhs - rhs
    }

    /// Init a dict with keys and values
    ///
    /// - Parameters:
    ///   - keys: key array
    ///   - values: value array
    public init(keys: [Key], values: [Value]) {
        precondition(keys.count == values.count)
        self.init()
        for (index, key) in keys.enumerated() {
            self[key] = values[index]
        }
    }
}
