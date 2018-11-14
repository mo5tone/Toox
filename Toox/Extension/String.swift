//
//  String.swift
//  Toox
//
//  Created by 门捷夫 on 2018/10/26.
//  Copyright © 2018 门捷夫. All rights reserved.
//

import Foundation

// MARK: - String to Date

extension String {
    /// Convert String to Date
    ///
    /// - Parameters:
    ///   - format: default is "yyyy-MM-dd HH:mm:ss"
    ///   - local:  defailt is .current
    ///   - secondsFromGMT: defailt is TimeZone.current.secondsFromGMT()
    /// - Returns: Date value of a String
    public func date(of format: String = "yyyy-MM-dd HH:mm:ss", local: Locale = Locale.current, secondsFromGMT: Int = TimeZone.current.secondsFromGMT()) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = local
        formatter.timeZone = TimeZone(secondsFromGMT: secondsFromGMT)
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
}
