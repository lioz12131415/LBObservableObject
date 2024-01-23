# LBObservableObject

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

