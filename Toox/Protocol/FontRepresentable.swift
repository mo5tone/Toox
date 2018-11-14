//
//  FontRepresentable.swift
//  Toox
//
//  Created by 门捷夫 on 2018/10/26.
//  Copyright © 2018 门捷夫. All rights reserved.
//

import Foundation

public protocol FontRepresentable: RawRepresentable {}

extension FontRepresentable where Self.RawValue == String {
    /// Get UIFont with name and size.
    ///
    /// - Parameter size: font size
    /// - Returns: the font
    public func font(ofSize size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        return UIFont(name: rawValue, size: size) ?? UIFont.systemFont(ofSize: size, weight: weight)
    }
}
