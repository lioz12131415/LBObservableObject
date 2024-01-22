//
//  UICollectionView.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 08/01/2024.
//

import UIKit
import Foundation

extension UICollectionView {
    // ==================================================== //
    // MARK: -
    // ==================================================== //
    internal func register(nibName: String) {
        let bundle = Bundle.main
        let nib    = UINib(nibName: nibName, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: nibName)
    }
}
