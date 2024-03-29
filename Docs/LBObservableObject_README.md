# LBObservableObject

<br>

# Attach

### Method
```swift 

   /*
    * attach method -> Attach The Object to observable_id to selected observable_group.
    * */
    @discardableResult public func attach(id: String, toGroup group: String) -> Self
    
```

### ARC Design
```swift 
objc.attach(id: "${ID}", toGroup: "${GEOUP}")
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
REMOVE FROM OLD GROUP
IF NEEDED
|                
v
ADD -----+->  OJBC Type + OBSERVABLE ID 
|             |
|             v
|             -----+-> GEOUP
|                      | 
|                      v
|                      -----+-> KEY: OJBC POINTER, VALUE: OBJC 
v
+----------------------+       
|   objc               |    
|   observable_id      |  
|   observable_group   |  
+----------------------+ 
```

<br>

# Post 

### Methods
```swift 
  /*
   *  Call Post Method Update The Objects With The Same Object Type And Same observable_id In The Selected Group.
   * */
   @discardableResult public func post(toGroup group: String) -> Self
  /*
   *  Call Post Method Update The Objects With The Same Object Type And Same observable_id In The Selected Groups.
   * */
   @discardableResult public func post(toGroups groups: [String]) -> Self
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

objc0.post(toGroups: ["B", "C"]) 
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


```

<br>

# Reflection

### Methods
```swift 
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
```

### ARC Design
```swift 

let new_instance = objc.reflection(group: "${GROUP}")
|
v
+-----------------------------+   
| CREATE NEW INSTANCE OF Self | ---+> +-----------------------------------+
+-----------------------------+       | MIRROR Self INTO THE NEW INSTANCE |
                                      +-----------------------------------+
                                      |                 
                +---------------------+
                |
                |
                v
+-----------------------------------+ 
| RETURN NEW INSTANCE `COPY OF Self |
+-----------------------------------+ 

```

<br>

# Copy

### Methods
```swift 
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
```

### ARC Design
```swift 

objc0.copy(from: objc1, group: "${GROUP}")
|
v
+----------------------------------------------+   
| MIRROR INTO Self ALL OTHER OBJECT PROPERTIES | 
+----------------------------------------------+ 
                        |                 
       +----------------+
       |
       |
       v
+-------------+ 
| RETURN Self |
+-------------+ 

```

<br>

# Observe

### Method
```swift 
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

### ARC Design
```swift 

objc0.observe(${TARGET})
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
                +-----------------------------------+ 
                | RETURN LBObservableObjectObserver |
                +-----------------------------------+ 
                |                                   |
                v                                   v
 +--------------------------------------+  +---------------------------------------+ 
 | objc0.observe(${TARGET}).remove()    |  | objc0.observe(${TARGET}).onPosted { } |    
 +--------------------------------------+  +---------------------------------------+ 
    
              
```
