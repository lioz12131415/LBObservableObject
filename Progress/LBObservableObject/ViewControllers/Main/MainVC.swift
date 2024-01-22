//
//  MainVC.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 22/01/2024.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var examples = [
        "UIButton"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate   = self
        tableView.dataSource = self
    }
}

extension MainVC: UITableViewDelegate {
    // =================================================== //
    // MARK: -
    // =================================================== //
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch examples[indexPath.row] {
            case "UIButton": ButtonExampleVC.show(over: self)
        default:
            break
        }
    }
}

extension MainVC: UITableViewDataSource {
    // =================================================== //
    // MARK: -
    // =================================================== //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExampleCell", for: indexPath) as! ExampleCell
        
        cell.example = examples[indexPath.row]
        return cell
    }
}
