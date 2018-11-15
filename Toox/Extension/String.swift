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
    ///   - formats: variadic parameter for dateFormats
    ///   - local:  defailt is .current
    ///   - secondsFromGMT: defailt is TimeZone.current.secondsFromGMT()
    /// - Returns: Date value of a String
    public func date(ofFormats formats: String..., local: Locale = .current, secondsFromGMT: Int = TimeZone.current.secondsFromGMT()) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = local
        formatter.timeZone = TimeZone(secondsFromGMT: secondsFromGMT)
        for format in formats {
            formatter.dateFormat = format
            if let date = formatter.date(from: self) {
                return date
            }
        }
        return nil
    }
}
