//
//  UIImageView+Extentions.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 22/01/2024.
//

import UIKit
import SDWebImage
import Foundation

public extension UIImageView {
    // =========================================== //
    // MARK: -  //
    // =========================================== //
    func set_image(with url: String,
                   animation: Bool = false,
                   default imageName: String? = nil, callback: (() -> Void)?=nil) {
        
        guard let url = url.tryUrlFragmentAllowed.convertToUrl else {
            return ( self.image = UIImage(named: imageName ?? .empty ) )
        }

        if animation {
            sd_imageTransition = .fade
        }
        sd_setImage(with: url) { [weak self] (image, error, _, _) in
            if let error       = error,
               let imageName   = imageName,
               SDWebImageErrorReason(rawValue: error._code) != .cancelled {
                self?.image = UIImage(named: imageName)
            }
            callback?()
        }
    }
}

extension UIImageView {
    // =========================================== //
    // MARK: -  //
    // =========================================== //
    enum SDWebImageErrorReason: Int {
        case cancelled                  = 2002
        case invalidURL                 = 1000
        case blackListed                = 1003
        case badImageData               = 1001
        case cacheNotModified           = 1002
        case invalidDownloadResponse    = 2003
        case invalidDownloadOperation   = 2000
        case invalidDownloadStatusCode  = 2001
        case invalidDownloadContentType = 2004
    }
}
