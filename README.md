# LBObservableObject
This library provides a custom Observable Objects LBObservableObject

<br>

# LBObservableObject #

### See the LBObservableObject Code [Examples](Docs/Examples/LBObservableObject_README.md)
### See the LBObservableObject [Docomotion](Docs/LBObservableObject_README.md) for more info.

## Example ##

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

## Methods ##

```swift 

 /*
  * attach method -> Attach The Object to observable_id to selected observable_group.
  * */
  @discardableResult public func attach(id: String, toGroup group: String) -> Self
    
  /*
   *  Call Post Method Update The Objects With The Same Object Type And Same observable_id In The Selected Group.
   * */
   @discardableResult public func post(toGroup group: String) -> Self
  /*
   *  Call Post Method Update The Objects With The Same Object Type And Same observable_id In The Selected Groups.
   * */
   @discardableResult public func post(toGroups groups: [String]) -> Self
   
  /*
   *  Call Reflection Method Return New instance Copy Of The Object (Without the Object observable_id And observable_group).
   *  /* observable_id    -> Default Value == "" (Empty String) */
   *  /* observable_group -> Default Value == "" (Empty String) */
   * */
   @discardableResult public func reflection() -> Self 
  /*
   *  Call Reflection Method Return New instance Copy Of The Object (With the Object observable_id In Selected Group).
   *  /* observable_id    -> Value == Object observable_id */
   *  /* observable_group -> Value == Selected Group  */
   * */
   @discardableResult public func reflection(group: String? = nil) -> Self 
   
  /*
   *  Call Copy Method Is Copy All The Other Object Properties (Without the Object observable_id And observable_group).
   *  /* observable_id    -> Value == Self observable_id    */
   *  /* observable_group -> Value == Self observable_group */
   * */
   @discardableResult public func copy(from object: LBObservableObject) -> Self
  
  /*
   *  Call Copy Method Is Copy All The Other Object Properties (With the Object observable_id In Selected Group).
   *  /* observable_id    -> Value == Object observable_id */
   *  /* observable_group -> Value == Selected Group  */
   * */
   @discardableResult public func copy(from object: LBObservableObject, group: String? = nil) -> Self
   
  /*
   *  Call Observe Method Added New Observer `Target` To Object Posted Changes.
   *  /* Return Instance Of LBObservableObjectObserver */
   * */
   public func observe<Target: NSObject>(_ target: Target) -> LBObservableObjectObserver
   /* LBObservableObjectObserver Methods. */
      |
      v
   /* public func remove() */
   /* public func onPosted(_ block: @escaping() -> Void) */ 
   
```

<br>

# LBObservableProperty #

### See the LBObservableProperty Code [Examples](Docs/Examples/LBObservableProperty_README.md)
### See the LBObservableProperty [Docomotion](Docs/LBObservableProperty_README.md) for more info.

## Example ##

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

## Methods ##
```swift 
  /*
   *  Call Post Method Update The Same Property Of The Parent Objects With The Same Object Type And Same observable_id In The Selected Group.
   * */
   public func post(toGroup group: String)
  /*
   * */
   public func post(toGroups groups: [String])
   
  /*
   *  Call Observe Method Added New Observer `Target` To Object Posted Changes.
   *  /* Return Instance Of LBObservableObjectObserver */
   * */
   public func observe<Target: NSObject>(_ target: Target) -> LBObservablePropertyObserver<Value>
   
   /* LBObservablePropertyObserver Methods. */
      |
      v
   /* public func remove() */
   /* public func onChange(_ block: @escaping() -> Void) */ 
   /* public func onChange(_ block: @escaping(_ newValue: Value) -> Void) */ 
```

<br>

# LBObservableArray #

### See the LBObservableArray Code [Examples](Docs/Examples/LBObservableArray_README.md)
### See the LBObservableArray [Docomotion](Docs/LBObservableArray_README.md) for more info.

## Example ##

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

<br>

# LBObservablePropertyBind #

### See the LBObservablePropertyBind Code [Examples](Docs/Examples/LBObservablePropertyBind_README.md)
### See the LBObservablePropertyBind [Docomotion](Docs/LBObservablePropertyBind_README.md) for more info.

## Example ##

```swift  
class Objc: LBObservableObject {
    
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
}

var object = Objc()
var button = UIButton()

/* button.bind return 'LBObservablePropertyButtonBinder' object */

button.bind.isEnabled(button_objc.$isEnabled) // set the button instance isEnabled -> objc isEnabled value & bind
button.bind.backgroundColor(button_objc.$backgroundColor) // set the button instance backgroundColor -> objc backgroundColor value & bind
button.bind.setTitleColor(button_objc.$textColor, for: .normal) // set the button instance textColor -> objc textColor value & bind

object.isEnabled = ${newValue} // change the instance of object isEnabled value & change the instance of button isEnabled value
object.textColor = ${newValue} // change the instance of object textColor value & change the instance of button textColor value 
object.backgroundColor = ${newValue} // change the instance of object backgroundColor value & change the instance of button backgroundColor value

```
