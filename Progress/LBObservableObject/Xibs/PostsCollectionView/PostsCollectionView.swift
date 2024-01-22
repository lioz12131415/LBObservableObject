//
//  PostsCollectionView.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 08/01/2024.
//

import UIKit
import Foundation

class PostsCollectionView: IBDesignableXibView {
    
    @IBOutlet weak var collectionView: UICollectionView!
        
    fileprivate var group = String.empty
    fileprivate var posts = LBArray<Post>()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(nibName: "PostCell")
        collectionView.delegate   = self
        collectionView.dataSource = self
    }
    
    
    
    internal func reload(_ posts: [Post], group: String) {
        self.group  = group
        self.posts += posts
        self.collectionView.reloadData()
                
        self.posts.first?.$text.observe(self).onChange { /*[weak self]*/ newValue in
            //self?.collectionView.reloadData()
        }
        
        self.posts.first?.observe(self).onPosted { /*[weak self] in */
            //self?.collectionView.reloadData()
        }
        
        self.posts.observe(self).onPosted { [weak self] in
            self?.collectionView.reloadData()
        }
        .attach(toGroup: group)
    }
}

extension PostsCollectionView: UICollectionViewDelegate {
    // ==================================================== //
    // MARK: -
    // ==================================================== //
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let array = [
            UIColor.gray,
            UIColor.blue,
            UIColor.green,
            UIColor.yellow,
        ]
        
        self.posts[indexPath.item]?.textColor = array.randomElement() ?? UIColor.white
        self.posts[indexPath.item]?.$textColor.post(toGroups: ["A", "B", "C", "D"])
    }
}

extension PostsCollectionView: UICollectionViewDataSource {
    // ==================================================== //
    // MARK: -
    // ==================================================== //
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
        
        cell.post = posts[indexPath.item]
        return cell
    }
}

extension PostsCollectionView: UICollectionViewDelegateFlowLayout {
    // ==================================================== //
    // MARK: -
    // ==================================================== //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width:  (collectionView.frame.width/3) - (2.0/3.0),
                     height: (collectionView.frame.width/3) - (2.0/3.0))
    }
}






