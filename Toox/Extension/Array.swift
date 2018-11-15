//
//  Array.swift
//  Toox
//
//  Created by 门捷夫 on 2018/11/15.
//  Copyright © 2018 门捷夫. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    /// Return element that is the specified distance from the given one
    ///
    /// - Parameters:
    ///   - element: given element
    ///   - offset: distance from the given element
    /// - Returns: result element
    public func element(_ element: Element, offsetBy offset: Int) -> Element? {
        if offset > 0 {
            guard let origin = lastIndex(of: element), let index = index(origin, offsetBy: offset, limitedBy: endIndex) else { return nil }
            return self[index]
        } else if offset < 0 {
            guard let origin = firstIndex(of: element), let index = index(origin, offsetBy: offset, limitedBy: startIndex) else { return nil }
            return self[index]
        } else {
            guard contains(element) else { return nil }
            return element
        }
    }
}
