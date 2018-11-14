//
//  UIWindow.swift
//  Toox
//
//  Created by 门捷夫 on 2018/10/26.
//  Copyright © 2018 门捷夫. All rights reserved.
//

import Foundation

extension UIWindow {
    public var visibleViewController: UIViewController? {
        return getVisibleViewControllerFrom(root: rootViewController)
    }

    private func getVisibleViewControllerFrom(root: UIViewController?) -> UIViewController? {
        if let navigationController = root as? UINavigationController {
            return getVisibleViewControllerFrom(root: navigationController.visibleViewController)
        } else if let tabBarController = root as? UITabBarController {
            return getVisibleViewControllerFrom(root: tabBarController.selectedViewController)
        } else if let presentedViewController = root?.presentedViewController {
            return getVisibleViewControllerFrom(root: presentedViewController)
        } else {
            return root
        }
    }
}
