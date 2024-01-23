# LBObservableObject

<br>

## Attach

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

## Post 

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

## Reflection

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

// let t = Self().copy(from: self, group: group)
