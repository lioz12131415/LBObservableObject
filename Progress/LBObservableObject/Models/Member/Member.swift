//
//  Member.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 07/01/2024.
//

import UIKit
import SwiftyJSON
import Foundation

class Member: LBObservableObject {
    
    @LBObservableProperty var id:   String = .empty
    @LBObservableProperty var name: String = .empty
    
    public required init() {
        super.init()
    }
}

extension Member {
    // ============================================ //
    // MARK: -
    // ============================================ //
    internal static func initialize(_ json: JSON, group: String) -> Member {
        let member = Member.Builder()
            .set(id:   json["id"].stringValue)
            .set(name: json["name"].stringValue)
            .build()
        
        member.attach(id: member.id, toGroup: group)
        return member
    }
}


extension Member {
    // ============================================ //
    // MARK: -
    // ============================================ //
    internal static var empty: Member {
        return Member()
    }
}
