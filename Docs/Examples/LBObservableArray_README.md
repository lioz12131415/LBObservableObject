# LBObservableArray Examples

```swift  
class Objc: LBObservableObject {
    
    @LBObservableProperty var id:   String = ""
    @LBObservableProperty var text: String = ""
    
    init(id: String, text: String, group: String) {
        super.init()
        self.id   = id
        self.text = text
        self.attach(id: id, toGroup: group)
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
        
        var array0 = LBObservableArray<Objc>()
        var array1 = LBObservableArray<Objc>()
        
        /*
         * setup arrays objects
         * */
        reload(array0, group: "A")
        reload(array1, group: "B")
        
        /*
         * observe & attach arrays
         * */
        array0.observe(self).onPosted {
            /* on Array Posted */
        }
        .attach(toGroup: "A")
        
        array1.observe(self).onPosted {
            /* on Array Posted */
        }
        .attach(toGroup: "B")
        
        /*
         * change array.
         * */
        array0.removeFirst()
        
        /*
         * post changes.
         * */
        array0.observe(self).post(toGroups: ["B"])
    }
    
    fileprivate func reload(_ array: LBObservableArray<Objc>, group: String) {
        for i in 0..<100 {
            let objc = Objc(id: "objc-id-\(i)", text: "objc-\(i)-text", group: group)
            array.append(objc)
        }
    }
}
```
