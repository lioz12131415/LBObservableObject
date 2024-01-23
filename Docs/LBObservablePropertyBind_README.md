# LBObservablePropertyBind

<br>

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

<br>

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

<br>

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

## UIImageView -> LBObservablePropertyImageViewBinder -> LBObservablePropertyViewBinder ##

### Variables ###
```swift  

    /* All Variables of Type LBObservablePropertyBind  */
    /*
     * LBObservablePropertyBind methods -> 
     * /* public func remove() */
     * /* public func onChange(_ block: @escaping() -> Void) */
     * /* public func onChange(_ block: @escaping(_ newValue: Value) -> Void) */
     * */
    
    public private(set) var image
    public private(set) var isHighlighted
    public private(set) var highlightedImage
    
```

### Methods ###
```swift  

    /*
     * */
    @discardableResult public func image<T: LBAnyImage>(_ property: LBObservableProperty<T>) -> LBPropertyBindImage
    /*
     * */
    @discardableResult public func isHighlighted<T: LBAnyImage>(_ property: LBObservableProperty<T>) -> LBPropertyBindBool
    /*
     * */
    @discardableResult public func highlightedImage<T: LBAnyImage>(_ property: LBObservableProperty<T>) -> LBPropertyBindImage 
```
