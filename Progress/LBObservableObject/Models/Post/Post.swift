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
    
    var array0 = LBObservableArray<Objc>()
    var array1 = LBObservableArray<Objc>()
    
    public required init() {
        super.init()
        
        let objc0 = Objc(id: "objc-id", text: "text-0", group: "A")
        let objc1 = Objc(id: "objc-id", text: "text-1", group: "B")
        
        objc0.attach(id: objc0.id, toGroup: "A")
        objc1.attach(id: objc1.id, toGroup: "B")
        
        objc0.$text.observe(self).onChange {
            
        }
        
        objc1.observe(self).onPosted {
            
        }
        
        objc0.$text.post(toGroup: "A")
        
        array0.observe(self).onPosted { [weak self] in
            
        }
        .attach(toGroup: "A")
    }
    
    internal func add(to array: LBObservableArray<Objc>, group: String) {
        for i in 0..<100 {
            array.append(Objc(id: "objc-id-\(i)", text: "text-\(i)", group: group))
        }
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

class Objc: LBObservableObject {
    
    @LBObservableProperty var id:   String = "SOME Id"
    @LBObservableProperty var text: String = "SOME Text"
    
    init(id: String, text: String, group: String) {
        super.init()
        self.id   = id
        self.text = text
        self.attach(id: id, toGroup: group)
    }
    
    internal required init() {
        super.init()
    }
}
