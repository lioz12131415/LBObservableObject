# LBObservableObject Examples

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
         * attach objects to deferent groups
         * */
        objc0.attach(id: objc0.id, toGroup: "A")
        objc1.attach(id: objc1.id, toGroup: "B")
        
        /*
         * observe Posted Changes
         * */
        objc0.observe(self).onPosted {
            print("objc0 Posted")
        }
        
        objc1.observe(self).onPosted {
            print("objc1 Posted")
        }
        
        /*
         * post object values to selected groups
         * */
        objc0.post(toGroups: ["B"])
        
        /*
         * print
         * objc0 text -> objc-0-text
         * objc1 text -> objc-0-text
         * */
        print("objc0 text = \(objc0.text)")
        print("objc1 text = \(objc1.text)")
    }
}

```

## Example 1
```swift
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let objc0 = Objc(id: "objc-id", text: "objc-0-text")
        /*
         * attach object to group
         * */
        objc0.attach(id: objc0.id, toGroup: "A")
        
        /*
         * reflection object instance into new instance
         *
         * objc1:
         * text -> "objc-0-text"
         * observable_id -> "objc-id"
         * observable_group -> "B"
         * */
        let objc1 = objc0.reflection(group: "B")
        
        /*
         * change value
         * objc0 text -> "objc-0-text"
         * objc1 text -> "objc-1-text-new-value"
         * */
        objc1.text = "objc-1-text-new-value"

        /*
         * post object values to selected groups
         * */
        objc1.post(toGroups: ["A"])
        
        /* print
         * objc0 text -> objc-1-text-new-value
         * objc1 text -> objc-1-text-new-value
         * */
        print("objc0 text = \(objc0.text)")
        print("objc1 text = \(objc1.text)")
    }
}
```

## Example 2
```swift 
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let objc0 = Objc(id: "objc-id", text: "objc-0-text")
        let objc1 = Objc(id: "objc-id", text: "objc-1-text")
       
        /*
         * attach objectS to groupS
         * */
        objc0.attach(id: objc0.id, toGroup: "A")
        objc1.attach(id: objc1.id, toGroup: "B")
        
        /* print
         * objc0 text -> objc-0-text
         * objc1 text -> objc-1-text
         * */
        print("objc0 text = \(objc0.text)")
        print("objc1 text = \(objc1.text)")

        /*
         * copy values from objc1 into objc0
         * */
        objc0.copy(from: objc1)
        
        /* print
         * objc0 text -> objc-1-text
         * objc1 text -> objc-1-text
         * */
        print("objc0 text = \(objc0.text)")
        print("objc1 text = \(objc1.text)")
    }
}
```
