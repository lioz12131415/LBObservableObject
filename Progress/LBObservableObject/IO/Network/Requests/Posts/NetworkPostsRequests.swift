//
//  NetworkPostsRequests.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 08/01/2024.
//

import UIKit
import SwiftyJSON
import Foundation

internal protocol NetworkPostsRequests where Self: Network.Requests {
    // ========================================== //
    // MARK: -
    // ========================================== //
    var posts: PostsRequests { get }
}

internal class PostsRequests {
    // ========================================== //
    // MARK: -
    // ========================================== //
    
}

extension PostsRequests {
    // ========================================== //
    // MARK: -
    // ========================================== //
    internal func all(group: String, _ callback: @escaping([Post]) -> Void) {
        let _json   = LBJSON(name: "posts")
        let _read   = _json.read() ?? _json.template()
        let _data   = JSON(_read ?? [:])["data"].dictionaryValue
        let _array  = _data.enumerated().compactMap { _data["post-\($0.offset)"] }
        
        callback(Post.initialize(jsons: _array, group: group))
    }
}

extension PostsRequests {
    // ========================================== //
    // MARK: -
    // ========================================== //
    internal func put(_ post: Post) {
        let _json = LBJSON(name: "posts")
        var _read = _json.read() ?? _json.template()
        var _data = _read?["data"] as? [String: Any]

        _data?[post.id] = PostsRequests.template(for: post)
        _read?["data"]  = _data
        _json.write(_read)
    }
}

extension PostsRequests {
    // ========================================== //
    // MARK: -
    // ========================================== //
    internal func delete(_ post: Post) {
        let _json = LBJSON(name: "posts")
        var _read = _json.read() ?? _json.template()
        var _data = _read?["data"] as? [String: Any]

        _data?.removeValue(forKey: post.id)
        _read?["data"]  = _data
        _json.write(_read)
    }
}

extension PostsRequests {
    // ========================================== //
    // MARK: -
    // ========================================== //
    fileprivate static func template(for post: Post) -> Dictionary<String, Any> {
        return [
            "attributes": [
                "id":   post.id,
                "text": post.text,
                
                "member": [
                    "id":   post.member.id,
                    "name": post.member.name,
                ],
                
                "image": [
                    "id":    post.image.id,
                    "value": post.image.value,
                ]
            ]
        ]
    }
}
