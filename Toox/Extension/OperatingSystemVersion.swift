//
//  OperatingSystemVersion.swift
//  Toox
//
//  Created by 门捷夫 on 2018/10/26.
//  Copyright © 2018 门捷夫. All rights reserved.
//

import Foundation

// MARK: - Equatable, Comparable

extension OperatingSystemVersion: Equatable, Comparable {
    public static func == (lhs: OperatingSystemVersion, rhs: OperatingSystemVersion) -> Bool {
        return lhs.majorVersion == rhs.majorVersion && lhs.minorVersion == rhs.minorVersion && lhs.patchVersion == rhs.patchVersion
    }

    public static func < (lhs: OperatingSystemVersion, rhs: OperatingSystemVersion) -> Bool {
        if lhs.majorVersion < rhs.majorVersion {
            return true
        } else if lhs.majorVersion == rhs.majorVersion {
            if lhs.minorVersion < rhs.minorVersion {
                return true
            } else if lhs.minorVersion == rhs.minorVersion {
                return lhs.patchVersion < rhs.patchVersion
            } else {
                return false
            }
        } else {
            return false
        }
    }
}
