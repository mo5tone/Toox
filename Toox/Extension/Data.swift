//
//  Data.swift
//  Toox
//
//  Created by 门捷夫 on 2018/10/26.
//  Copyright © 2018 门捷夫. All rights reserved.
//

import Foundation

// MARK: - APNs

extension Data {
    /// String value of Device Token in Apple Push Notification service
    public var tokenOfAPNs: String? { return map { String(format: "%02.2hhx", $0) }.joined() }
}
