# LBObservableArray

<br>

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

<br>

## Methods ##

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

# Observe

### Method
```swift 
  /*
   *  Call Observe Method Added New Observer `Target` To Array Posted Changes.
   *  /* Return Instance Of LBObservableArrayObserver */
   * */
   public func observe<Target: NSObject>(_ target: Target) -> LBObservableArrayObserver<Element>
   
   /* LBObservableArrayObserver Methods. */
      |
      v
   /*  */
   /* public func onPosted(_ block: @escaping() -> Void) */ 
```

### LBObservableArrayObserver Method
```swift 
   /*
    * */
   @discardableResult public func remove() -> Self
   /*
    * */
   @discardableResult public func post(toGroup group: String) -> Self
   /*
    * */
   @discardableResult public func post(toGroups groups: [String])  -> Self
   /*
    * */
   @discardableResult public func onPosted(_ block: @escaping() -> Void) -> Self
   /*
    * */
   @discardableResult public func post_items_changes(toGroup group: String)  -> Self
   /*
    * */
   @discardableResult public func post_items_changes(toGroups groups: [String])  -> Self
```
