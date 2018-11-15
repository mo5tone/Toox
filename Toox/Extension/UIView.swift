//
//  UIView.swift
//  Toox
//
//  Created by 门捷夫 on 2018/10/26.
//  Copyright © 2018 门捷夫. All rights reserved.
//

import Foundation

// MARK: - Corner and Border

extension UIView {
    /// Make a round corner
    ///
    /// - Parameters:
    ///   - radius: corner radius
    ///   - corners: corners rounded, default is .allCorners
    public func addCorner(withRadius radius: CGFloat, corners: UIRectCorner = .allCorners) {
        if corners == .allCorners {
            layer.cornerRadius = radius
            layer.masksToBounds = true
        } else {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }

    /// Add a border
    ///
    /// - Parameters:
    ///   - width: border width
    ///   - color: border color
    ///   - edges: edges to draw borders, default is .all
    public func addBorder(withWidth width: CGFloat, color: UIColor = .white, edges: UIRectEdge = .all) {
        if edges == .all {
            layer.borderWidth = width
            layer.borderColor = color.cgColor
        } else {
            clipsToBounds = true
            let subLayer = CALayer()
            subLayer.borderWidth = width
            subLayer.borderColor = color.cgColor
            let x = edges.contains(.left) ? 0 : -width
            let y = edges.contains(.top) ? 0 : -width
            let w = frame.width - x + (edges.contains(.right) ? 0 : width)
            let h = frame.height - y + (edges.contains(.bottom) ? 0 : width)
            subLayer.frame = CGRect(x: x, y: y, width: w, height: h)
            layer.addSublayer(subLayer)
        }
    }
}
