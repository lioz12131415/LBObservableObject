//
//  LBObservablePropertyLabelBinder.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 19/01/2024.
//

import UIKit
import Foundation

public class LBObservablePropertyLabelBinder<View: UILabel>: LBObservablePropertyViewBinder<View> {
    
    public private(set) /**/ var font:                      LBPropertyBindFont?               = nil
    public private(set) /**/ var text:                      LBPropertyBindText?               = nil
    public private(set) /**/ var isEnabled:                 LBPropertyBindBool?               = nil
    public private(set) /**/ var textColor:                 LBPropertyBindColor?              = nil
    public private(set) /**/ var numberOfLines:             LBPropertyBindInt?                = nil
    public private(set) /**/ var isHighlighted:             LBPropertyBindBool?               = nil
    public private(set) /**/ var textAlignment:             LBPropertyBindTextAlignment?      = nil
    public private(set) /**/ var minimumScaleFactor:        LBPropertyBindCGFloat?            = nil
    public private(set) /**/ var baselineAdjustment:        LBPropertyBindBaselineAdjustment? = nil
    public private(set) /**/ var highlightedTextColor:      LBPropertyBindColor?              = nil
    public private(set) /**/ var adjustsFontSizeToFitWidth: LBPropertyBindBool?               = nil
   
    public override var view: View? {
        return super.view
    }
    
    internal override init() {
        super.init()
    }
    
    public required init(_ view: View? = nil) {
        super.init(view)
    }

    /*
     * */
    @discardableResult public func font<T: LBAnyFont>(_ property: LBObservableProperty<T>) -> LBPropertyBindFont {
        guard let property = property.convert(to: UIFont.self) else {
            return .empty
        }
        if let font = font, font.contains(property) {
            return font
        }
        return LBPropertyBindFont(property, &font) { [weak self] in
            self?.view?.font = $0
        }
    }
    /*
     * */
    @discardableResult public func text<T: LBAnyString>(_ property: LBObservableProperty<T>) -> LBPropertyBindText {
        guard let property = property.convert(to: String.self) else {
            return .empty
        }
        if let text = text, text.contains(property) {
            return text
        }
        return LBPropertyBindText(property, &text) { [weak self] in
            self?.view?.text = $0
        }
    }
    /*
     * */
    @discardableResult public func isEnabled<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool {
        guard let property = property.convert(to: Bool.self) else {
            return .empty
        }
        if let isEnabled = isEnabled, isEnabled.contains(property) {
            return isEnabled
        }
        return LBPropertyBindBool(property, &isEnabled) { [weak self] in
            self?.view?.isEnabled = $0
        }
    }
    /*
     * */
    @discardableResult public func numberOfLines<T: LBAnyInt>(_ property: LBObservableProperty<T>) -> LBPropertyBindInt {
        guard let property = property.convert(to: Int.self) else {
            return .empty
        }
        if let numberOfLines = numberOfLines, numberOfLines.contains(property) {
            return numberOfLines
        }
        return LBPropertyBindInt(property, &numberOfLines) { [weak self] in
            self?.view?.numberOfLines = $0
        }
    }
    //
    /*
     * */
    @discardableResult public func textColor<T: LBAnyColor>(_ property: LBObservableProperty<T>) -> LBPropertyBindColor {
        guard let property = property.convert(to: UIColor.self) else {
            return .empty
        }
        if let textColor = textColor, textColor.contains(property) {
            return textColor
        }
        return LBPropertyBindColor(property, &textColor) { [weak self] in
            self?.view?.textColor = $0
        }
    }
    /*
     * */
    @discardableResult public func isHighlighted<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool {
        guard let property = property.convert(to: Bool.self) else {
            return .empty
        }
        if let isHighlighted = isHighlighted, isHighlighted.contains(property) {
            return isHighlighted
        }
        return LBPropertyBindBool(property, &isHighlighted) { [weak self] in
            self?.view?.isHighlighted = $0
        }
    }
    /*
     * */
    @discardableResult public func textAlignment<T: LBAnyTextAlignment>(_ property: LBObservableProperty<T>) -> LBPropertyBindTextAlignment {
        guard let property = property.convert(to: NSTextAlignment.self) else {
            return .empty
        }
        if let textAlignment = textAlignment, textAlignment.contains(property) {
            return textAlignment
        }
        return LBPropertyBindTextAlignment(property, &textAlignment) { [weak self] in
            self?.view?.textAlignment = $0
        }
    }
    //
    /*
     * */
    @discardableResult public func minimumScaleFactor<T: LBAnyCGFloat>(_ property: LBObservableProperty<T>) -> LBPropertyBindCGFloat {
        guard let property = property.convert(to: CGFloat.self) else {
            return .empty
        }
        if let minimumScaleFactor = minimumScaleFactor, minimumScaleFactor.contains(property) {
            return minimumScaleFactor
        }
        return LBPropertyBindCGFloat(property, &minimumScaleFactor) { [weak self] in
            self?.view?.minimumScaleFactor = $0
        }
    }
    /*
     * */
    @discardableResult public func baselineAdjustment<T: LBAnyBaselineAdjustment>(_ property: LBObservableProperty<T>) -> LBPropertyBindBaselineAdjustment {
        guard let property = property.convert(to: UIBaselineAdjustment.self) else {
            return .empty
        }
        if let baselineAdjustment = baselineAdjustment, baselineAdjustment.contains(property) {
            return baselineAdjustment
        }
        return LBPropertyBindBaselineAdjustment(property, &baselineAdjustment) { [weak self] in
            self?.view?.baselineAdjustment = $0
        }
    }
    /*
     * */
    @discardableResult public func highlightedTextColor<T: LBAnyColor>(_ property: LBObservableProperty<T>) -> LBPropertyBindColor {
        guard let property = property.convert(to: UIColor.self) else {
            return .empty
        }
        if let highlightedTextColor = highlightedTextColor, highlightedTextColor.contains(property) {
            return highlightedTextColor
        }
        return LBPropertyBindColor(property, &highlightedTextColor) { [weak self] in
            self?.view?.highlightedTextColor = $0
        }
    }
    /*
     * */
    @discardableResult public func adjustsFontSizeToFitWidth<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool {
        guard let property = property.convert(to: Bool.self) else {
            return .empty
        }
        if let adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth, adjustsFontSizeToFitWidth.contains(property) {
            return adjustsFontSizeToFitWidth
        }
        return LBPropertyBindBool(property, &adjustsFontSizeToFitWidth) { [weak self] in
            self?.view?.adjustsFontSizeToFitWidth = $0
        }
    }
}



