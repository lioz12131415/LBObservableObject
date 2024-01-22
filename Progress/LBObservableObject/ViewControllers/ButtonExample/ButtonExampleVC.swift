//
//  ButtonExampleVC.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 22/01/2024.
//

import UIKit

fileprivate class Button_Objc: LBObservableObject {
    
    @LBObservableProperty var isEnabled:       Bool    = false
    @LBObservableProperty var textColor:       UIColor = .darkGray
    @LBObservableProperty var backgroundColor: UIColor = .lightGray
    
    init(isEnabled: Bool, textColor: UIColor, backgroundColor: UIColor) {
        self.isEnabled = isEnabled
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }
    
    required init() {
        super.init()
    }
    
    internal static var new: Button_Objc {
        return Button_Objc()
    }
}

class ButtonExampleVC: UIViewController {
    
    @IBOutlet weak var button:    UIButton!
    @IBOutlet weak var textField: UITextField!
    
    fileprivate var button_objc: Button_Objc = {
        .new
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    fileprivate func setup() {
        button.bind.isEnabled(button_objc.$isEnabled)
        button.bind.backgroundColor(button_objc.$backgroundColor)
        button.bind.setTitleColor(button_objc.$textColor, for: .normal)
    }
    
    internal static func show(over vc: UIViewController?) {
        let storyboard = UIStoryboard(name: "ButtonExample", bundle: nil)
        let navigation = storyboard.instantiateInitialViewController() as! UINavigationController
        vc?.present(navigation, animated: true)
    }
}

extension ButtonExampleVC {
    // ============================================== //
    // MARK: - IBActions
    // ============================================== //
    @IBAction func doneTouch(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func closeTouch(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func textChange(_ sender: UITextField) {
        let isValidEmail = textField.text?.isValidEmail ?? false
        
        button_objc.isEnabled       = isValidEmail
        button_objc.textColor       = isValidEmail ? .black : .darkGray
        button_objc.backgroundColor = isValidEmail ? .white : .lightGray
    }
}
