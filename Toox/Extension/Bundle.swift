//
//  Bundle.swift
//  Toox
//
//  Created by 门捷夫 on 2018/10/26.
//  Copyright © 2018 门捷夫. All rights reserved.
//

import Foundation

extension Bundle {
    public struct ApplicationInfo {
        let bundle: Bundle

        /// Short version
        public var shortVersion: String? {
            return bundle.infoDictionary?["CFBundleShortVersionString"] as? String
        }

        /// Build
        public var build: String? {
            return bundle.infoDictionary?[kCFBundleVersionKey as String] as? String
        }

        /// Identifier
        public var identifier: String? {
            return bundle.infoDictionary?[kCFBundleNameKey as String] as? String
        }
    }

    public var applicationInfo: ApplicationInfo {
        return ApplicationInfo(bundle: self)
    }
}
