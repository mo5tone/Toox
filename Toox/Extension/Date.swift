//
//  Date.swift
//  Toox
//
//  Created by 门捷夫 on 2018/10/26.
//  Copyright © 2018 门捷夫. All rights reserved.
//

import Foundation

// MARK: - Date to String

extension Date {
    /// Convert Date to String
    ///
    /// - Parameters:
    ///   - format: default is "yyyy-MM-dd HH:mm:ss"
    ///   - locale: defailt is .current
    ///   - secondsFromGMT: defailt is TimeZone.current.secondsFromGMT()
    /// - Returns: String value of a Date
    public func string(of format: String = "yyyy-MM-dd HH:mm:ss", locale: Locale = .current, secondsFromGMT: Int = TimeZone.current.secondsFromGMT()) -> String {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.timeZone = TimeZone(secondsFromGMT: secondsFromGMT)
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

// MARK: - Start & end of A day

extension Date {
    /// The start of a Date
    public var start: Date {
        return Calendar.current.startOfDay(for: self)
    }

    /// The end of a Date
    public var end: Date? {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: start)
    }
}
