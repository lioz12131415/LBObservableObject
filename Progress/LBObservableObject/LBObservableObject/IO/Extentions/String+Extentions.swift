//
//  String.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 05/01/2024.
//

import Foundation

extension String {
    // ================================ //
    // MARK: -
    // ================================ //
    internal static var empty: String {
        return ""
    }
}

extension String {
    // ================================ //
    // MARK: -
    // ================================ //
    internal var nsstringValue: NSString {
        return self as NSString
    }
}

extension String {
    // ================================ //
    // MARK: -
    // ================================ //
    internal var convertToUrl: URL? {
        return URL(string: replacingOccurrences(of: " ", with: "%20"))
    }
}

extension String {
    // ================================ //
    // MARK: -
    // ================================ //
    internal var tryUrlFragmentAllowed: String {
        return addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? self
    }
}
