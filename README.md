# LBObservableObject
This library provides a custom Observable Objects LBObservableObject

<br>

# LBObservableObject #
## Example ##

```swift 
class Objc: LBObservableObject {
    
    @LBObservableProperty var id:   String = "SOME Id"
    @LBObservableProperty var text: String = "SOME Text"
    
    init(id: String, text: String) {
        self.id   = id
        self.text = text
    }
    
    internal required init() {
        super.init()
    }
}


let objc0 = Objc(id: "objc-id", text: "text-0")
let objc1 = Objc(id: "objc-id", text: "text-1")

objc0.attach(id: objc0.id, toGroup: "A")
objc1.attach(id: objc1.id, toGroup: "B")

objc0.observe(self).onPosted {
            
}
        
objc1.observe(self).onPosted {
    
}

// objc0 text == "text-0"
// objc1 text == "text-1"

objc0.post(toGroup: "B") /* OR objc0.post(toGroups: ["B", ...]) */

// objc0 text == "text-0"
// objc1 text == "text-0"

```

## Methods ##

### Attach Method ###
```swift  
    /*
     * Attach The Object to observable_id / observable_group
     * */
    @discardableResult public func attach(id: String, toGroup group: String) -> Self
```

### Post Methods ###
```swift  
    /*
     *  Post changes to Selected Group (will post changes to objects with same observable_id in selected group)
     * */
    @discardableResult public func post(toGroups groups: [String]) -> Self
    /*
     *  Post changes to Selected Groups (will post changes to objects with same observable_id in selected groups)
     * */
    @discardableResult public func post(toGroups groups: [String]) -> Self
```

### Reflection Method ###
```swift  
    /*
     *  create new instance of selected object (if the object have observable_id and the group params is not nil it will attach the group new instance with the observable_id to the selected group)
     * */
    @discardableResult public func reflection(group: String? = nil) -> Self 
    
```

### Copy Method ###
```swift  
    /*
     *  Copy all the object fields (Except the observable_id & observable_group)
     * (if the object have observable_id and the group params is not nil it will attach the group new instance with the observable_id to the selected group)
     * */
        @discardableResult public func copy(from object: LBObservableObject, group: String? = nil) -> Self
    
```

### Observe Method ###
```swift  
    /*
     * Observe the changes Object `LBObservableObjectObserver`.
     * */
    public func observe<Target: NSObject>(_ target: Target) -> LBObservableObjectObserver
    /*
     * `LBObservableObjectObserver`
     *  /* public func remove() */
     *  /* public func onPosted(_ block: @escaping() -> Void) */
     * */
    
    //Example
    objc.observe(${ SOME NSObject Observer Target }).onPosted {
        /* Call when object posted */
    }
```

<br>

# LBObservableProperty #
## Example ##

```swift 
class Objc: LBObservableObject {
    
    @LBObservableProperty var id:   String = "SOME Id"
    @LBObservableProperty var text: String = "SOME Text"
    
    init(id: String, text: String) {
        self.id   = id
        self.text = text
    }
    
    internal required init() {
        super.init()
    }
}

let objc0 = Objc(id: "objc-id", text: "text-0")
let objc1 = Objc(id: "objc-id", text: "text-1")

objc0.attach(id: objc0.id, toGroup: "A")
objc1.attach(id: objc1.id, toGroup: "B")

objc0.$text.observe(self).onChange { newValue in
    /* the new variable value */
}
        
objc1.$text.observe(self).onChange { newValue in
    /* the new variable value */
}

// objc0 text == "text-0"
// objc1 text == "text-1"

objc0.$text.post(toGroup: "B") /* OR objc0.$text.post(toGroups: ["B", ...])  */

// objc0 text == "text-0"
// objc1 text == "text-0"

```

## Methods ##

### Post Methods ###
```swift  
    /*
     *  Post changes to Selected Group
     * */
    public func post(toGroup group: String)
    /*
     *  Post changes to Selected Groups
     * */
     public func post(toGroups groups: [String])
```

### Observe Method ###
```swift  
    /*
     * Observe the property changes Object `LBObservablePropertyObserver`.
     * */
    public func observe<Target: NSObject>(_ target: Target) -> LBObservablePropertyObserver<Value>
    /*
     * `LBObservablePropertyObserver`
     *  /* public func remove() */
     *  /* public func onChange(_ block: @escaping() -> Void) */
     *  /* public func onChange(_ block: @escaping(_ newValue: Value) -> Void) */
     * */
    
    //Example
    objc0.$text.observe(${ SOME NSObject Observer Target }).onChange {
        /* Call when property value change */
    }
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
    
    array0.observe(self).onPosted { [weak self] in
        /* on Array Posted */
    }
    .attach(toGroup: "A")
    
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

button.bind.isEnabled(button_objc.$isEnabled)
button.bind.backgroundColor(button_objc.$backgroundColor)
button.bind.setTitleColor(button_objc.$textColor, for: .normal)

object.isEnabled = ${newValue} // will change the button instance isEnabled 
object.textColor = ${newValue} // will change the button instance textColor 
object.backgroundColor = ${newValue} // will change the button instance backgroundColor 

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

