//
//  UIApplication.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 22/01/2024.
//

import UIKit
import Foundation

extension UIApplication {
    // ======================================== //
    // MARK: -
    // ======================================== //
    var keyWindow: UIWindow? {
        return UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
}

extension UIApplication {
    // ================================================================= //
    // MARK: -  //
    // ================================================================= //
    static var presentedVC: UIViewController? {
        var presentViewController = UIApplication.shared.keyWindow?.rootViewController
        while let pVC = presentViewController?.presentedViewController {
            presentViewController = pVC
        }
        return presentViewController
    }
}

extension UIApplication {
    // ===================================================================== //
    // MARK: -  //
    // ===================================================================== //
    static func topPresentedVC(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topPresentedVC(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topPresentedVC(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topPresentedVC(presented)
        }
        return base
    }
}
