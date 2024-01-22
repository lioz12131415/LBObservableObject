//
//  LBObservablePropertyImageViewBinder.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 22/01/2024.
//

import UIKit
import Foundation

public class LBObservablePropertyImageViewBinder<View: UIImageView>: LBObservablePropertyViewBinder<View> {
    
    public private(set) /**/ var image:            LBPropertyBindImage?  = nil
//    public private(set) /**/ var image_url:        LBPropertyBindString? = nil
    public private(set) /**/ var isHighlighted:    LBPropertyBindBool?   = nil
    public private(set) /**/ var highlightedImage: LBPropertyBindImage?  = nil
    
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
    @discardableResult public func image<T: LBAnyImage>(_ property: LBObservableProperty<T>) -> LBPropertyBindImage {
        guard let property = property.convert(to: UIImage.self) else {
            return .empty
        }
        if let image = image, image.contains(property) {
            return image
        }
        return LBPropertyBindImage(property, &image) { [weak self] in
            self?.view?.image = $0
        }
    }
    /*
     * */
    @discardableResult public func isHighlighted<T: LBAnyImage>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool {
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
    @discardableResult public func highlightedImage<T: LBAnyImage>(_ property: LBObservableProperty<T>) -> LBPropertyBindImage {
        guard let property = property.convert(to: UIImage.self) else {
            return .empty
        }
        if let highlightedImage = highlightedImage, highlightedImage.contains(property) {
            return highlightedImage
        }
        return LBPropertyBindImage(property, &highlightedImage) { [weak self] in
            self?.view?.highlightedImage = $0
        }
    }
//    /*
//     * */
//    @discardableResult public func set_image<T: LBAnyString>(_ property: LBObservableProperty<T>) -> LBPropertyBindString {
//        guard let property = property.convert(to: String.self) else {
//            return .empty
//        }
//        /* */
//        view?.sd_cancelCurrentImageLoad()
//        /* */
//        if let image_url = image_url, image_url.contains(property) {
//            return image_url
//        }
//        return LBPropertyBindString(property, &image_url) { [weak self] in
//            self?.view?.set_image(with: $0)
//        }
//    }
}


