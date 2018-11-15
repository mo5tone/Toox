//
//  UIButton.swift
//  Toox
//
//  Created by 门捷夫 on 2018/10/26.
//  Copyright © 2018 门捷夫. All rights reserved.
//

import Foundation

extension UIButton {
    /// update edge insets with space and direction
    ///
    /// - Parameters:
    ///   - space: space between image and title
    ///   - direction: direction of image and title layout, default is 0: horizontal, otherwise: vertical
    ///   - reversed: false is image at left or top, otherwise right or bottom
    public func setEdgeInsets(space: CGFloat = 0, direction: Int = 0, reversed: Bool = false) {
        layoutIfNeeded()
        guard let sizeOfImage = imageView?.frame.size, let sizeOfTitle = titleLabel?.frame.size else { return }
        var imageInsets: UIEdgeInsets = .zero
        var titleInsets: UIEdgeInsets = .zero
        var contentInsets: UIEdgeInsets = .zero
        switch (direction, reversed) {
        case (0, false):
            imageInsets = UIEdgeInsets(top: 0, left: -space / 2, bottom: 0, right: space / 2)
            titleInsets = UIEdgeInsets(top: 0, left: space / 2, bottom: 0, right: -space / 2)
            let extraWidth = space
            contentInsets = UIEdgeInsets(top: 0, left: extraWidth / 2, bottom: 0, right: extraWidth / 2)
        case (0, true):
            imageInsets = UIEdgeInsets(top: 0, left: sizeOfTitle.width + space / 2, bottom: 0, right: -sizeOfTitle.width - space / 2)
            titleInsets = UIEdgeInsets(top: 0, left: -sizeOfImage.width - space / 2, bottom: 0, right: sizeOfImage.width + space / 2)
            let extraWidth = space
            contentInsets = UIEdgeInsets(top: 0, left: extraWidth / 2, bottom: 0, right: extraWidth / 2)
        case (_, false):
            imageInsets = UIEdgeInsets(top: -sizeOfTitle.height - space / 2, left: 0, bottom: 0, right: -sizeOfTitle.width)
            titleInsets = UIEdgeInsets(top: 0, left: -sizeOfImage.width, bottom: -sizeOfImage.height - space / 2, right: 0)
            let extraHeight = sizeOfImage.height + sizeOfTitle.height - max(sizeOfImage.height, sizeOfTitle.height) + space
            contentInsets = UIEdgeInsets(top: extraHeight / 2, left: 0, bottom: extraHeight / 2, right: 0)
        case (_, true):
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -sizeOfTitle.height - space / 2, right: -sizeOfTitle.width)
            titleInsets = UIEdgeInsets(top: -sizeOfImage.height - space / 2, left: -sizeOfImage.width, bottom: 0, right: 0)
            let extraHeight = sizeOfImage.height + sizeOfTitle.height - max(sizeOfImage.height, sizeOfTitle.height) + space
            contentInsets = UIEdgeInsets(top: extraHeight / 2, left: 0, bottom: extraHeight / 2, right: 0)
        }
        titleEdgeInsets = titleInsets
        imageEdgeInsets = imageInsets
        contentEdgeInsets = contentInsets
    }
}
