# LBObservableProperty Examples

```swift 
class Objc: LBObservableObject {
    
    @LBObservableProperty var id:   String = ""
    @LBObservableProperty var text: String = ""
    
    init(id: String, text: String) {
        super.init()
        self.id   = id
        self.text = text
    }
    
    internal required init() {
        super.init()
    }
}
```

## Example 0

```swift
 
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let objc0 = Objc(id: "objc-id", text: "objc-0-text")
        let objc1 = Objc(id: "objc-id", text: "objc-1-text")
       
        /*
         * attach objectS to groups
         * */
        objc0.attach(id: objc0.id, toGroup: "A")
        objc1.attach(id: objc1.id, toGroup: "B")
        
        /*
         * observe Changes
         * */
        objc0.$text.observe(self).onChange { newValue in
            print("objc0 text newValue = \(newValue)")
        }
        
        objc1.$text.observe(self).onChange { newValue in
            print("objc1 text newValue = \(newValue)")
        }
        
        /* print
         * objc0 text -> objc-0-text
         * objc1 text -> objc-1-text
         * */
        print("objc0 text = \(objc0.text)")
        print("objc1 text = \(objc1.text)")

        objc0.$text.post(toGroups: ["B"])
        
        /* print
         * objc0 text -> objc-0-text
         * objc1 text -> objc-0-text
         * */
        print("objc0 text = \(objc0.text)")
        print("objc1 text = \(objc1.text)")
    }
}

```
