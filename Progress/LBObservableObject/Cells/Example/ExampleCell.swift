//
//  ExampleCell.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 22/01/2024.
//

import UIKit

class ExampleCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    internal var example: String = "" {
        didSet { setInfo() }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        /*
         * */
        selectionStyle = .none
    }
    
    fileprivate func setInfo() {
        label.text = example
    }
}
