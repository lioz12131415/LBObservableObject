//
//  IBDesignableXibView.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 08/01/2024.
//

import UIKit
import Foundation

@IBDesignable
open class IBDesignableXibView: UIView, NibReplaceable {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        guard subviews.isEmpty, let nibView = replacedByNibView() else { return }
        nibView.frame            = bounds
        nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(nibView)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        guard subviews.isEmpty, let nibView = replacedByNibView() else { return }
        nibView.frame            = bounds
        nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(nibView)
    }
}

public protocol NibReplaceable where Self: UIView {
    // ========================================== //
    // MARK: -
    // ========================================== //
}

extension NibReplaceable {
    // ========================================== //
    // MARK: -
    // ========================================== //
    fileprivate func replacedByNibView() -> UIView? {
        let nibView = type(of: self).nibView(withOwner: self)
        return nibView
    }
}

extension NibReplaceable {
    // ========================================== //
    // MARK: -
    // ========================================== //
    static func nibView(withOwner ownerOrNil: Any? = nil) -> UIView? {
        let nib  = UINib(nibName: nibName, bundle: Bundle(for: self))
        let view = nib.instantiate(withOwner: ownerOrNil, options: nil)[0] as? UIView
        return view
    }
}

extension NibReplaceable {
    // ========================================== //
    // MARK: -
    // ========================================== //
    static var nibName: String {
        return String(describing: self)
    }
}

