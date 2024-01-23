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
## Example ##

```swift  
class Objc: LBObservableObject {
    
    @LBObservableProperty var id:   String = "SOME Id"
    @LBObservableProperty var text: String = "SOME Text"
    
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
    
    var array0 = LBObservableArray<Objc>()
    var array1 = LBObservableArray<Objc>()
    
    add(to: array0, group: "A")
    add(to: array1, group: "B")
    
    /*self must be of type NSObject*/
    array0.observe(self).onPosted { [weak self] in
        /* on Array Posted */
    }
    .attach(toGroup: "A")
    
    /*self must be of type NSObject*/
    array1.observe(self).onPosted { [weak self] in
        /* on Array Posted */
    }
    .attach(toGroup: "B")
    
    array0.removeFirst()
    array0.observe(self).post(toGroup: "B") /* OR array0.observe(self).post(toGroups: ["B", ...])  */
    
    internal func add(to array: LBObservableArray<Objc>, group: String) {
        for i in 0..<100 {
            array.append(Objc(id: "objc-id-\(i)", text: "text-\(i)", group: group))
        }
    }
```

## Variables ##

```swift  
    /*
    * */
    public var count: Int
    /*
    * */
    public var last: Element?
    /*
    * */
    public var first: Element?
    
```

## Methods ##

### Static ###
```swift  
    /*
    * */
    public static func ==(lhs: LBObservableArray, rhs: LBObservableArray) -> Bool
    /*
    * */
    public static func +=(lhs: inout LBObservableArray, rhs: LBObservableArray)
    /*
    * */
    public static func +(lhs: inout LBObservableArray, rhs: LBObservableArray)
    /*
    * */
    public static func +=(lhs: inout LBObservableArray, rhs: [Element])
    /*
    * */
    public static func +(lhs: inout LBObservableArray, rhs: [Element])
    
```

### Discardable Result ###
```swift  
    /*
    * */
    @discardableResult public func popLast() -> Element?
    /*
    * */
    @discardableResult public func removeLast() -> Element
    /*
    * */
    @discardableResult public func removeFirst() -> Element
    /*
    * */
    @discardableResult public func remove(at index: Int) -> Element
    /*
    * */
```

### Others ###
```swift  
    /*
    * */
    public func append(_ newElement: Element)
    /*
    * */
    public func insert(_ newElement: Element, at i: Int)
    /*
    * */
    public func append(contentsOf newElements: [Element])
    /*
    * */
    public func removeAll(keepingCapacity keepCapacity: Bool = false)
    
    /*
    * */
    public func forEach(_ body: (Element) -> Void)
    /*
    * */
    public func map<T>(_ transform: (Element) -> T) -> [T]
    /*
    * */
    public func filter(_ isIncluded: (Element) -> Bool) -> [Element]
    /*
    * */
    public func first(where predicate: (Element) -> Bool) -> Element?
    /*
    * */
    public func firstIndex(where predicate: (Element) -> Bool) -> Int?
    /*
    * */
    public func firstIndex(of element: Element) -> Int? where Element: Equatable
    /*
    * */
    public func compactMap<Result>(_ transform: (Element) -> Result?) -> [Result]
```

<br>

# LBObservablePropertyBind #

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

## UIView -> LBObservablePropertyViewBinder ##

### Variables ###
```swift  

    /* All Variables of Type LBObservablePropertyBind  */
    /*
     * LBObservablePropertyBind methods -> 
     * /* public func remove() */
     * /* public func onChange(_ block: @escaping() -> Void) */
     * /* public func onChange(_ block: @escaping(_ newValue: Value) -> Void) */
     * */
     
    public private(set) var alpha
    public private(set) var isOpaque
    public private(set) var isHidden
    public private(set) var tintColor
    public private(set) var clipsToBounds
    public private(set) var backgroundColor
    public private(set) var tintAdjustmentMode
    public private(set) var isUserInteractionEnabled
    
```

### Methods ###
```swift  

    /*
     * */
    @discardableResult public func alpha<T: LBAnyCGFloat>(_ property: LBObservableProperty<T>) -> LBPropertyBindCGFloat
    /*
     * */
    @discardableResult public func isOpaque<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool 
    /*
     * */
    @discardableResult public func isHidden<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool
    /*
     * */
    @discardableResult public func tintColor<T: LBAnyColor>(_ property: LBObservableProperty<T>) -> LBPropertyBindColor
    /*
     * */
    @discardableResult public func clipsToBounds<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool
    /*
     * */
    @discardableResult public func backgroundColor<T: LBAnyColor>(_ property: LBObservableProperty<T>) -> LBPropertyBindColor
    /*
     * */
    @discardableResult public func tintAdjustmentMode<T: LBAnyTintAdjustmentMode>(_ property: LBObservableProperty<T>) -> LBPropertyBindTintAdjustmentMode
    /*
     * */
    @discardableResult public func isUserInteractionEnabled<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool
    /*
     * */

    /*
     * */
```

## UIButton -> LBObservablePropertyButtonBinder -> LBObservablePropertyViewBinder ##

### Variables ###
```swift  

    /* All Variables of Type LBObservablePropertyBind  */
    /*
     * LBObservablePropertyBind methods -> 
     * /* public func remove() */
     * /* public func onChange(_ block: @escaping() -> Void) */
     * /* public func onChange(_ block: @escaping(_ newValue: Value) -> Void) */
     * */
    
    public private(set) var role
    public private(set) var title
    public private(set) var image
    public private(set) var isEnabled
    public private(set) var titleColor
    public private(set) var backgroundImage
    public private(set) var titleShadowColor
    public private(set) var isPointerInteractionEnabled
    public private(set) var changesSelectionAsPrimaryAction
    public private(set) var automaticallyUpdatesConfiguration
```

### Methods ###
```swift  

    /*
     * */
    @discardableResult public func role<T: LBAnyButtonRole>(_ property: LBObservableProperty<T>) -> LBPropertyBindButtonRole
    /*
     * */
    @discardableResult public func isEnabled<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool
    /*
     * */
    @discardableResult public func isPointerInteractionEnabled<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool
    /*
     * */
    @available(iOS 15.0, *)
    @discardableResult public func changesSelectionAsPrimaryAction<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool
    /*
     * */
    @available(iOS 15.0, *)
    @discardableResult public func automaticallyUpdatesConfiguration<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool
    /*
     * */
    @discardableResult public func setTitle<T: LBAnyString>(_ property: LBObservableProperty<T>, for state: UIControl.State) -> LBPropertyBindText
    /*
     * */
    @discardableResult public func setImage<T: LBAnyImage>(_ property: LBObservableProperty<T>, for state: UIControl.State) -> LBPropertyBindImage
    /*
     * */
    @discardableResult public func setTitleColor<T: LBAnyColor>(_ property: LBObservableProperty<T>, for state: UIControl.State) -> LBPropertyBindColor
    /*
     * */
    @discardableResult public func setTitleShadowColor<T: LBAnyColor>(_ property: LBObservableProperty<T>, for state: UIControl.State) -> LBPropertyBindColor
    /*
     * */
    @discardableResult public func setBackgroundImage<T: LBAnyImage>(_ property: LBObservableProperty<T>, for state: UIControl.State) -> LBPropertyBindImage
```

## UILabel -> LBObservablePropertyLabelBinder -> LBObservablePropertyViewBinder ##

### Variables ###
```swift  

    /* All Variables of Type LBObservablePropertyBind  */
    /*
     * LBObservablePropertyBind methods -> 
     * /* public func remove() */
     * /* public func onChange(_ block: @escaping() -> Void) */
     * /* public func onChange(_ block: @escaping(_ newValue: Value) -> Void) */
     * */
    
    public private(set) var font
    public private(set) var text
    public private(set) var isEnabled
    public private(set) var textColor
    public private(set) var numberOfLines
    public private(set) var isHighlighted
    public private(set) var textAlignment
    public private(set) var minimumScaleFactor
    public private(set) var baselineAdjustment
    public private(set) var highlightedTextColor
    public private(set) var adjustsFontSizeToFitWidth
    
```

### Methods ###
```swift  

    /*
     * */
    @discardableResult public func font<T: LBAnyFont>(_ property: LBObservableProperty<T>) -> LBPropertyBindFont
    /*
     * */
    @discardableResult public func text<T: LBAnyString>(_ property: LBObservableProperty<T>) -> LBPropertyBindText
    /*
     * */
    @discardableResult public func isEnabled<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool 
    /*
     * */
    @discardableResult public func numberOfLines<T: LBAnyInt>(_ property: LBObservableProperty<T>) -> LBPropertyBindInt
    /*
     * */
    @discardableResult public func textColor<T: LBAnyColor>(_ property: LBObservableProperty<T>) -> LBPropertyBindColor
    /*
     * */
    @discardableResult public func isHighlighted<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool
    /*
     * */
    @discardableResult public func textAlignment<T: LBAnyTextAlignment>(_ property: LBObservableProperty<T>) -> LBPropertyBindTextAlignment
    /*
     * */
    @discardableResult public func minimumScaleFactor<T: LBAnyCGFloat>(_ property: LBObservableProperty<T>) -> LBPropertyBindCGFloat
    /*
     * */
    @discardableResult public func baselineAdjustment<T: LBAnyBaselineAdjustment>(_ property: LBObservableProperty<T>) -> LBPropertyBindBaselineAdjustment 
    /*
     * */
    @discardableResult public func highlightedTextColor<T: LBAnyColor>(_ property: LBObservableProperty<T>) -> LBPropertyBindColor
    /*
     * */
    @discardableResult public func adjustsFontSizeToFitWidth<T: LBAnyBool>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool
```

<br>

# ARC Design #

## LBObservableObject ##
```swift

+-----------+          +---------+
|           | <-+----- | objc    |
|    objc   |          +---------+
|    ID: 1  |          | group A |
|           |          +---------+
+-----------+          

+-----------+          +---------+
|           | <-+----- | objc    |
|    objc   |          +---------+
|    ID: 1  |          | group B |
|           |          +---------+
+-----------+        

+-----------+          +---------+
|           | <-+----- | objc    |
|    objc   |          +---------+
|    ID: 1  |          | group C |
|           |          +---------+
+-----------+    

/* objc group A */
/* post update the same objects with the same id in selected groups */
objc.post(toGroups: ["B", "C"]) 
+---------------+
|     UPDATE    |
+---------------+
|               | 
v               v
+-----------+  +-----------+     
|           |  |           |
|   objc    |  |   objc    |    
|   ID: 1   |  |   ID: 1   |
|   group B |  |   group C |
|           |  |           |  
+-----------+  +-----------+ 


/* objc attach */
objc.attach(id: objc.id, toGroup: "${Selected Group}")
+---------------+
|     ATTACH    |
+---------------+
|                
v 
+-------------+
|     Pool    |
+-------------+
|                
v   
ADD -----+->  OJBC Type + Observable ID 
|             |                
|             v
|             -----+-> Group
|                       |                
|                       v
|                       -----+-> KEY: pointer objc value, VALUE: OBJC
v                 
+----------------------+      
|                      | 
|   objc               |    
|   observable_id      |  
|   observable_group   |  
|                      | 
+----------------------+ 


/* objc observe */
objc.observe(${Target: NSObject})
+---------------+
|     OBSERVE   |
+---------------+
    |
    v
    +--------------------+
    | LBObservableObject |          
    |      Observer      | ----+-> +-----------------+ 
    +--------------------+         |   Targets Pool  |                 
                                   +-----------------+
                                             |  
                                             |
                                             +-----+-> GET || CREATE 
                                                       Observer OBJECT FOR Target TO Observe Objc Posted Changes
                                                         |
                  +--------------------------------------+
                  |
                  v
    +----------------------------+
    | LBObservableObjectObserver |
    +----------------------------+
                  |
                  v
/* objc observe remove */
objc.observe(${Target}).remove()
/* objc observe onPosted */
objc.observe(${Target}).onPosted { /* BLOCK */ }
    

    
```
