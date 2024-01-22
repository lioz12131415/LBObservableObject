//
//  BVC.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 05/01/2024.
//

import UIKit

class BVC: UIViewController {
    
    @IBOutlet weak var postsCollectionView: PostsCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        request()
    }
    
    fileprivate func request() {
        Network.requsts.posts.all(group: "B") { [weak self] posts in
            self?.postsCollectionView.reload(posts, group: "B")
        }
    }
}
