//
//  DVC.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 05/01/2024.
//

import UIKit

class DVC: UIViewController {

    @IBOutlet weak var postsCollectionView: PostsCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        request()
    }
    
    fileprivate func request() {
        Network.requsts.posts.all(group: "D") { [weak self] posts in
            self?.postsCollectionView.reload(posts, group: "D")
        }
    }
}
