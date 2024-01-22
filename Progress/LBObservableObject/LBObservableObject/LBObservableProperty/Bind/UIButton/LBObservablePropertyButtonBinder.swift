//
//  LBObservablePropertyButtonBinder.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 21/01/2024.
//

import UIKit
import Foundation

public class LBObservablePropertyButtonBinder<View: UIButton>: LBObservablePropertyViewBinder<View> {
    
    public private(set) /**/ var role:                              LBPropertyBindButtonRole?   = nil
    public private(set) /**/ var title:                             LBPropertyBindText?         = nil
    public private(set) /**/ var image:                             LBPropertyBindImage?        = nil
    public private(set) /**/ var isEnabled:                         LBPropertyBindBool?         = nil
    public private(set) /**/ var titleColor:                        LBPropertyBindColor?        = nil
    public private(set) /**/ var backgroundImage:                   LBPropertyBindImage?        = nil
    public private(set) /**/ var titleShadowColor:                  LBPropertyBindColor?        = nil
    public private(set) /**/ var isPointerInteractionEnabled:       LBPropertyBindBool?         = nil
    public private(set) /**/ var changesSelectionAsPrimaryAction:   LBPropertyBindBool?         = nil
    public private(set) /**/ var automaticallyUpdatesConfiguration: LBPropertyBindBool?         = nil

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
    @discardableResult public func role<T: LBAnyButtonRole>(_ property: LBObservableProperty<T>) -> LBPropertyBindButtonRole {
        guard let property = property.convert(to: UIButton.Role.self) else {
            return .empty
        }
        if let role = role, role.contains(property) {
            return role
        }
        return LBPropertyBindButtonRole(property, &role) { [weak self] in
            self?.view?.role = $0
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
    @discardableResult public func isPointerInteractionEnabled<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool {
        guard let property = property.convert(to: Bool.self) else {
            return .empty
        }
        if let isPointerInteractionEnabled = isPointerInteractionEnabled, isPointerInteractionEnabled.contains(property) {
            return isPointerInteractionEnabled
        }
        return LBPropertyBindBool(property, &isPointerInteractionEnabled) { [weak self] in
            self?.view?.isPointerInteractionEnabled = $0
        }
    }
    /*
     * */
    @available(iOS 15.0, *)
    @discardableResult public func changesSelectionAsPrimaryAction<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool {
        guard let property = property.convert(to: Bool.self) else {
            return .empty
        }
        if let changesSelectionAsPrimaryAction = changesSelectionAsPrimaryAction, changesSelectionAsPrimaryAction.contains(property) {
            return changesSelectionAsPrimaryAction
        }
        return LBPropertyBindBool(property, &changesSelectionAsPrimaryAction) { [weak self] in
            self?.view?.changesSelectionAsPrimaryAction = $0
        }
    }
    /*
     * */
    @available(iOS 15.0, *)
    @discardableResult public func automaticallyUpdatesConfiguration<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool {
        guard let property = property.convert(to: Bool.self) else {
            return .empty
        }
        if let automaticallyUpdatesConfiguration = automaticallyUpdatesConfiguration, automaticallyUpdatesConfiguration.contains(property) {
            return automaticallyUpdatesConfiguration
        }
        return LBPropertyBindBool(property, &automaticallyUpdatesConfiguration) { [weak self] in
            self?.view?.automaticallyUpdatesConfiguration = $0
        }
    }
    /*
     * */
    @discardableResult public func setTitle<T: LBAnyString>(_ property: LBObservableProperty<T>, for state: UIControl.State) -> LBPropertyBindText {
        guard let property = property.convert(to: String.self) else {
            return .empty
        }
        if let title = title, title.contains(property) {
            return title
        }
        return LBPropertyBindText(property, &title) { [weak self] in
            self?.view?.setTitle($0, for: state)
        }
    }
    /*
     * */
    @discardableResult public func setImage<T: LBAnyImage>(_ property: LBObservableProperty<T>, for state: UIControl.State) -> LBPropertyBindImage {
        guard let property = property.convert(to: UIImage.self) else {
            return .empty
        }
        if let image = image, image.contains(property) {
            return image
        }
        return LBPropertyBindImage(property, &image) { [weak self] in
            self?.view?.setImage($0, for: state)
        }
    }
    /*
     * */
    @discardableResult public func setTitleColor<T: LBAnyColor>(_ property: LBObservableProperty<T>, for state: UIControl.State) -> LBPropertyBindColor {
        guard let property = property.convert(to: UIColor.self) else {
            return .empty
        }
        if let titleColor = titleColor, titleColor.contains(property) {
            return titleColor
        }
        return LBPropertyBindColor(property, &titleColor) { [weak self] in
            self?.view?.setTitleColor($0, for: state)
        }
    }
    /*
     * */
    @discardableResult public func setTitleShadowColor<T: LBAnyColor>(_ property: LBObservableProperty<T>, for state: UIControl.State) -> LBPropertyBindColor {
        guard let property = property.convert(to: UIColor.self) else {
            return .empty
        }
        if let titleShadowColor = titleShadowColor, titleShadowColor.contains(property) {
            return titleShadowColor
        }
        return LBPropertyBindColor(property, &titleShadowColor) { [weak self] in
            self?.view?.setTitleShadowColor($0, for: state)
        }
    }
    /*
     * */
    @discardableResult public func setBackgroundImage<T: LBAnyImage>(_ property: LBObservableProperty<T>, for state: UIControl.State) -> LBPropertyBindImage {
        guard let property = property.convert(to: UIImage.self) else {
            return .empty
        }
        if let backgroundImage = backgroundImage, backgroundImage.contains(property) {
            return backgroundImage
        }
        return LBPropertyBindImage(property, &backgroundImage) { [weak self] in
            self?.view?.setBackgroundImage($0, for: state)
        }
    }
}
