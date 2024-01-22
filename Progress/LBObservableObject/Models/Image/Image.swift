//
//  Image.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 07/01/2024.
//

import UIKit
import SwiftyJSON
import Foundation

class Image: LBObservableObject {
    
    @LBObservableProperty var id:    String = .empty
    @LBObservableProperty var value: String = .empty
    
    public required init() {
        super.init()
    }
}

extension Image {
    // ============================================ //
    // MARK: -
    // ============================================ //
    public static func initialize(_ json: JSON, group: String) -> Image {
        let image = Image.Builder()
            .set(id:    json["id"].stringValue)
            .set(value: json["value"].stringValue)
            .build()
        
        image.attach(id: image.id, toGroup: group)
        return image
    }
}


extension Image {
    // ============================================ //
    // MARK: -
    // ============================================ //
    internal static var empty: Image {
        return Image()
    }
}
