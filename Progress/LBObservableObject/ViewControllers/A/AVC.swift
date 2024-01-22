//
//  AVC.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 05/01/2024.
//

import UIKit
import Combine

class AVC: UIViewController {
    
    @IBOutlet weak var postsCollectionView: PostsCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        request()
    }
    
    fileprivate func request() {
        Network.requsts.posts.all(group: "A") { [weak self] posts in
            self?.postsCollectionView.reload(posts, group: "A")
        }
    }
}
