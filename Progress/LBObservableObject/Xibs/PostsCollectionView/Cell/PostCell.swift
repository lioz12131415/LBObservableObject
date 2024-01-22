//
//  PostCell.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 08/01/2024.
//

import UIKit

class PostCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel:     UILabel!
    @IBOutlet weak var nameLabel:     UILabel!
    @IBOutlet weak var postImageView: UIImageView!
        
    internal var post: Post = .empty {
        didSet { setInfo() }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    internal func setInfo() {
        textLabel.bind.text(post.$text)
        nameLabel.bind.text(post.member.$name)
        textLabel.bind.textColor(post.$textColor)
        //postImageView.bind().set_image(post.$image_url)
    }
}


