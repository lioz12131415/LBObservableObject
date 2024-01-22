//
//  CVC.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 05/01/2024.
//

import UIKit

class CVC: UIViewController {

    @IBOutlet weak var postsCollectionView: PostsCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        request()
    }
    
    fileprivate func request() {
        Network.requsts.posts.all(group: "C") { [weak self] posts in
            self?.postsCollectionView.reload(posts, group: "C")
        }
    }
}
