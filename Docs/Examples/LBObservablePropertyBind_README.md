# LBObservablePropertyBind Examples

## Example 0

```swift  
class Objc: LBObservableObject {
    
    @LBObservableProperty var id:              String  = ""
    @LBObservableProperty var isEnabled:       Bool    = false
    @LBObservableProperty var titleColor:      UIColor = .darkGray
    @LBObservableProperty var backgroundColor: UIColor = .lightGray
    
    init(id: String, group: String) {
        super.init()
        self.id = id
        self.attach(id: id, toGroup: group)
    }
    
    internal required init() {
        super.init()
    }
}

let objc   = Objc(id: "objc-id", group: "A")
let button = UIButton()
                
button.bind.isEnabled(objc.$isEnabled)
button.bind.backgroundColor(objc.$backgroundColor)
button.bind.setTitleColor(objc.$titleColor, for: .normal)
                        
button.bind.isEnabled?.onChange { newValue in
    print("isEnabled newValue = \(newValue)")
}
    
button.bind.titleColor?.onChange { newValue in
    print("textColor newValue = \(newValue)")
}
        
button.bind.backgroundColor?.onChange { newValue in
    print("backgroundColor newValue = \(newValue)")
}
                        
objc.isEnabled       = ${NewValue}
objc.titleColor      = ${NewValue}
objc.backgroundColor = ${NewValue}
```

## Example 1

```swift  
class Objc: LBObservableObject {
    
    @LBObservableProperty var id:              String   = ""
    @LBObservableProperty var image:           UIImage? = nil
    @LBObservableProperty var backgroundColor: UIColor  = .lightGray
    
    init(id: String, group: String) {
        super.init()
        self.id = id
        self.attach(id: id, toGroup: group)
    }
    
    internal required init() {
        super.init()
    }
}

let objc      = Objc(id: "objc-id", group: "A")
let imageView = UIImageView()
        
imageView.bind.image(objc.$image).onChange { newValue in
    print("image newValue = \(newValue)")
}
        
imageView.bind.backgroundColor(objc.$backgroundColor).onChange { newValue in
    print("backgroundColor newValue = \(newValue)")
}
        
objc.image           = ${NewValue}
objc.backgroundColor = ${NewValue}
```
