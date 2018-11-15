//
//  CALayer.swift
//  Toox
//
//  Created by 门捷夫 on 2018/10/26.
//  Copyright © 2018 门捷夫. All rights reserved.
//

import Foundation

// MARK: - Sketch Shadow

extension CALayer {
    /// Add shadow by sketch parameters to CALayer
    ///
    /// - Parameters:
    ///   - color: shadow color, default is .black
    ///   - alpha: shadow opacity, default is 0.5
    ///   - offset: shadow offset, default is .zero
    ///   - blur: shadow radius, default is 4
    ///   - spread: shadow path
    public func addSketchShadow(withColor color: UIColor = .black, alpha: Float = 0.5, offset: CGSize = .zero, blur: CGFloat = 4, spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = offset
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
