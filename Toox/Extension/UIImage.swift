//
//  UIImage.swift
//  Toox
//
//  Created by 门捷夫 on 2018/10/26.
//  Copyright © 2018 门捷夫. All rights reserved.
//

import Foundation

// MARK: - Init

extension UIImage {
    /// Generate an Image with fill color and size
    ///
    /// - Parameters:
    ///   - color: fill color
    ///   - size: image size, default is CGSize(width: 1, height: 1)
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }

    /// Convert String to a QRCode Image
    ///
    /// - Parameter code: string to be converted
    public convenience init?(qr code: String) {
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        let data = code.data(using: .ascii)
        filter.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 3, y: 3)
        guard let output = filter.outputImage?.transformed(by: transform) else { return nil }
        self.init(ciImage: output)
    }
}

extension UIImage {
    /// Render Image with color
    ///
    /// - Parameter color: new color
    /// - Returns: new image with color
    public func renderedImage(ofColor color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        var rendered: UIImage?
        if let context = UIGraphicsGetCurrentContext(), let cgImage = self.cgImage {
            color.setFill()
            context.translateBy(x: 0, y: size.height)
            context.scaleBy(x: 1.0, y: -1.0)
            context.clip(to: CGRect(x: 0, y: 0, width: size.width, height: size.height), mask: cgImage)
            context.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
            rendered = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return rendered
    }

    /// Scale Image to destination size
    ///
    /// - Parameter newSize: destination size
    /// - Returns: new image with size
    public func scaledImage(ofSize size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: CGRect(origin: CGPoint.zero, size: size))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }

    /// Add a shadow to Image
    ///
    /// - Parameters:
    ///   - color: shadow color
    ///   - offset: shadow offset
    ///   - blur: shadow path
    /// - Returns: An Image with shadow
    public func shadowedImage(ofColor color: UIColor = .black, offset: CGSize = .zero, blur: CGFloat = 0) -> UIImage? {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let heightOfShadowed = size.height + blur + ((abs(offset.height) > blur / 2) ? abs(offset.height) - blur / 2 : 0)
        let widthOfShadowd = size.width + blur + ((abs(offset.width) > blur / 2) ? abs(offset.width) - blur / 2 : 0)
        let premultipliedLastRaw = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue).rawValue
        guard let cgImage = self.cgImage, let shadowContext = CGContext(data: nil, width: Int(widthOfShadowd), height: Int(heightOfShadowed), bitsPerComponent: cgImage.bitsPerComponent, bytesPerRow: 0, space: colorSpace, bitmapInfo: premultipliedLastRaw) else { return nil }
        shadowContext.setShadow(offset: offset, blur: blur, color: color.cgColor)
        let originX = blur / 2 + (offset.width > 0 ? 0 : -offset.width)
        let originY = blur / 2 + (offset.height > 0 ? 0 : -offset.height)
        let newRect = CGRect(origin: CGPoint(x: originX, y: originY), size: size)
        shadowContext.draw(cgImage, in: newRect)
        guard let shadowedCGImage = CGContext.makeImage(shadowContext)() else { return nil }
        let shadowedImage = UIImage(cgImage: shadowedCGImage)
        return shadowedImage
    }
}
