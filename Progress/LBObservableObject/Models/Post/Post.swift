//
//  Post.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 05/01/2024.
//

import UIKit
import SwiftyJSON
import Foundation

class Post: LBObservableObject {
    
    internal var image:  Image  = .empty
    internal var member: Member = .empty
     
    @LBObservableProperty var id:        String  = .empty
    @LBObservableProperty var text:      String  = .empty
    @LBObservableProperty var textColor: UIColor = .white
    
    public required init() {
        super.init()
    }
}

extension Post {
    // ======================================= //
    // MARK: -
    // ======================================= //
    public static func initialize(jsons: [JSON], group: String) -> [Post] {
        var array = [Post]()
        jsons.forEach { array.append( Post.initialize($0, group: group) ) }
        return array
    }
}

extension Post {
    // ======================================= //
    // MARK: -
    // ======================================= //
    public static func initialize(_ json: JSON, group: String) -> Post {
        let post = Post.Builder()
            .set(id:     json["attributes"]["id"].stringValue)
            .set(text:   json["attributes"]["text"].stringValue)
            .set(image:  Image.initialize(json["attributes"]["image"],  group: group))
            .set(member: Member.initialize(json["attributes"]["member"], group: group))
            .build()
        
        post.attach(id: post.id, toGroup: group)
        return post
    }
}

extension Post {
    // ============================================ //
    // MARK: -
    // ============================================ //
    internal static var empty: Post {
        return Post()
    }
}
