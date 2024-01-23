# LBObservableProperty

<br>

# Post 

### Methods
```swift 
  /*
   *  Call Post Method Update The Same Property Of The Parent Objects With The Same Object Type And Same observable_id In The Selected Group.
   * */
   public func post(toGroup group: String)
  /*
   * */
   public func post(toGroups groups: [String])
```

### ARC Design
```swift 
+---------------------------------------------------------+
|                          POOL                           |
+---------------------------------------------------------+
         |                  |                   |
         v                  v                   v
+----------------+  +----------------+  +----------------+
| objc0          |  | objc1          |  | objc2          |
| ID = "objc-id" |  | ID = "objc-id" |  | ID = "objc-id" |
| TYPE = Object  |  | TYPE = Object  |  | TYPE = Object  |    
| GROUP = "A"    |  | GROUP = "B"    |  | GROUP = "C"    |
+----------------+  +----------------+  +----------------+
        |                   |                   |
        v                   v                   v
+----------------+  +----------------+  +----------------+
| Property text  |  | Property text  |  | Property text  |
| = "text-0"     |  | = "text-1"     |  | = "text-2"     |
+----------------+  +----------------+  +----------------+

objc0.$text.post(toGroups: ["B", "C"])
|                 
v
-----+-> +---------------+
         |     UPDATE    |
         +---------------+ 
         |               |
         v               v
+----------------+ +----------------+
| objc1          | | objc2          |
| ID = "objc-id" | | ID = "objc-id" |
| TYPE = Object  | | TYPE = Object  |
| GROUP = "B"    | | GROUP = "C"    |
+----------------+ +----------------+
        |                  |
        v                  v
+----------------+ +----------------+
| Property text  | | Property text  |
| = "text-0"     | | = "text-0"     |
+----------------+ +----------------+

```


<br>

# Observe

### Method
```swift 
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

### ARC Design
```swift 

objc0.$text.observe(${TARGET})
 |
 v
+--------------+   
| TARGETS POOL | ---+> +---------------+
+--------------+       | GET OR CREATE |
                       +---------------+
                               |
                            +--+
                            |
                            v
                +-------------------------------------+ 
                | RETURN LBObservablePropertyObserver |
                +-------------------------------------+ 
                |                                   |
                v                                   v
+-----------------------------------------+  +---------------------------------------------+ 
| objc0.$text.observe(${TARGET}).remove() |  | objc0.$text.observe(${TARGET}).onChange { } |    
+-----------------------------------------+  +---------------------------------------------+ 
                                                                 OR              
                                             +---------------------------------------------------------+ 
                                             | objc0.$text.observe(${TARGET}).onChange { newValue in } | 
                                             +---------------------------------------------------------+ 
                                             
```
