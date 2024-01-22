//
//  Test.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 09/01/2024.
//

import Foundation

//        let array = [
//            UIColor.gray,
//            UIColor.blue,
//            UIColor.green,
//            UIColor.yellow,
//        ]
//
//        self.posts[indexPath.item]?.textColor = array.randomElement() ?? UIColor.white
//        self.posts[indexPath.item]?.$textColor.post(toGroups: ["A", "B", "C", "D"])
//        let array = [
//            "text-test-0",
//            "text-test-1",
//            "text-test-2",
//        ]
//        self.posts[indexPath.item]?.text = array.randomElement() ?? ""
//        self.posts[indexPath.item]?.$text.post(toGroups: ["A", "B", "C", "D"])

//extension LBObservableProperty: LBObservablePropertyAnyString where Value: LBObservablePropertyAnyString { }

//extension LBObservableProperty: LBObservablePropertyAnyString where Value == String? { }


//func extensions<T: LBObservablePropertyValueType>(of value: LBObservableObjectPropertyDynamic) -> LBObservableProperty<T>? {
////    class Extensions: LBObservablePropertyValueType {
////        static func == (lhs: Extensions, rhs: Extensions) -> Bool {
////            return true
////        }
////    }
//    var extensions: LBObservableProperty<T>? //= Extensions()
//    withUnsafePointer(to: &extensions) { pointer in
//        UnsafeMutableRawPointer(mutating: pointer).assumingMemoryBound(to: LBObservableObjectPropertyDynamic?.self).pointee = value
//    }
//    return extensions
//}

//func extensions(of value: LBObservablePropertyBindProtocol?) -> LBPropertyBindText<String>? {
//    var extensions: LBPropertyBindText<String>?
//    withUnsafePointer(to: &extensions) { pointer in
//        UnsafeMutableRawPointer(mutating: pointer).assumingMemoryBound(to: LBObservablePropertyBindProtocol?.self).pointee = value
//    }
//    return extensions
//}


//    @discardableResult public func text(_ property: LBObservableProperty<String?>) -> LBPropertyBindText<String?> {
//        var text: LBPropertyBindText<String?>?
//        if let text = text, text.contains(property) {
//            return text
//        }
//        return LBPropertyBindText(property, &text) { [weak self] in
//            self?.this?.text = $0
//        }
//    }
    
    
//    @discardableResult public func text(_ property: LBObservableProperty<String?>) -> LBPropertyBindText<String?> {
//        if let text = text, text.contains(property) {
//            return text
//        }
//        return LBObservablePropertyBindString(property, &text) { [weak self] in
//            self?.this?.text = $0
//        }
//    }

//extension LBObservableProperty {
//    // ====================================================== //
//    // MARK: -
//    // ====================================================== //
//    internal static func convert(_ value: LBObservableObjectPropertyDynamic) -> LBObservableProperty<Value>? {
//        var property: LBObservableProperty<Value>?
//        withUnsafePointer(to: &property) { pointer in
//            UnsafeMutableRawPointer(mutating: pointer).assumingMemoryBound(to: LBObservableObjectPropertyDynamic?.self).pointee = value
//        }
//        return property
//    }
//}

// LBObservableProperty+Extentions
//func extensions<T: LBObservablePropertyValueType>(of value: LBObservableObjectPropertyDynamic) -> LBObservableProperty<T>? {
////    class Extensions: LBObservablePropertyValueType {
////        static func == (lhs: Extensions, rhs: Extensions) -> Bool {
////            return true
////        }
////    }
//    var extensions: LBObservableProperty<T>? //= Extensions()
//    withUnsafePointer(to: &extensions) { pointer in
//        UnsafeMutableRawPointer(mutating: pointer).assumingMemoryBound(to: LBObservableObjectPropertyDynamic?.self).pointee = value
//    }
//    return extensions
//}


//
//protocol LBObservablePropertyBindFontProtocol: LBObservablePropertyBindProtocol {
//    /*
//     * */
//    var font: LBObservablePropertyBindFont? { get }
//    /*
//     * */
//    var _font: LBObservablePropertyBindFont? { get set }
//}
//
//
//extension LBObservablePropertyBindProtocol {
//    // =============================================== //
//    // MARK: -
//    // =============================================== //
//    internal var fontValue: LBObservablePropertyBindFontProtocol? {
//        return self as? LBObservablePropertyBindFontProtocol
//    }
//}

//import UIKit
//import Foundation
//
//protocol LBObservablePropertyBindTextProtocol: LBObservablePropertyBindProtocol {
//    /*
//     * */
//    var text: LBObservablePropertyBindText? { get }
//    /*
//     * */
//    var _text: LBObservablePropertyBindText? { get set }
//}
//
//
//extension LBObservablePropertyBindProtocol {
//    // =============================================== //
//    // MARK: -
//    // =============================================== //
//    internal var textValue: LBObservablePropertyBindTextProtocol? {
//        return self as? LBObservablePropertyBindTextProtocol
//    }
//}
//


//extension LBObservablePropertyBind {
//    // =============================================== //
//    // MARK: -
//    // =============================================== //
//    fileprivate static func _initialize(_ property: Property, _ delegate: Delegate?, _ body: @escaping Body) -> Self {
//        if let _text     = delegate.text,
//           let _property = _text.bind?._property, _property.isEqual(property) {
//            return _text
//        }
//
//        return LBObservablePropertyBindText(property, delegate, body)
//    }
//}


//    typealias Bind     = LBObservablePropertyBindObject<String>
//    typealias Delegate = LBObservablePropertyBindTextProtocol
    
//    fileprivate /**/ var bind:     Bind?     = nil
//    fileprivate /**/ var delegate: Delegate? = nil
//
//    fileprivate init() {
//        /* */
//    }
//
//    fileprivate init(_ property: LBObservableProperty<String>,
//                     _ delegate: LBObservablePropertyBindTextProtocol, _ body: @escaping(String) -> Void) {
//        self.bind     = Bind(property, body)
//        self.delegate = delegate
//    }
//    /*
//     * */
//    public func remove() {
//        self.delegate?.text = nil
//    }
//    /*
//     * */
//    public func onChange(_ block: @escaping() -> Void) {
//        self.bind?.onChange(block)
//    }
//    /*
//     * */
//    public func onChange(_ block: @escaping(_ newValue: String) -> Void) {
//        self.bind?.onChange(block)
//    }

//extension LBObservablePropertyBindText {
//    // =============================================== //
//    // MARK: -
//    // =============================================== //
//    internal static func initialize(_ property: LBObservableProperty<String>,
//                                    _ delegate: LBObservablePropertyBindTextProtocol,
//                                    _ body: @escaping(String) -> Void) -> LBObservablePropertyBindText {
//        if let _text     = delegate.text,
//           let _property = _text.bind?._property, _property.isEqual(property) {
//            return _text
//        }
//
//        return LBObservablePropertyBindText(property, delegate, body)
//    }
//}


//    /*
//     * */
//    internal class func initialize<B: Bind>(_ bind:     B?,
//                                            _ property: Property,
//                                            _ delegate: Delegate?, _ body: @escaping Body) -> B? {
//        guard let oldValue = bind?.property, oldValue.isEqual(property) else {
//            return B(property, delegate, body)
//        }
//        return bind
//    }

//deinit {
//    _property?.observe(self).remove()
//}

//
//// // // // // // // // // // // // // // // // // //
//fileprivate var initialObserverTargetsKey: UInt8 = 0
//// // // // // // // // // // // // // // // // // //
//
//fileprivate typealias Targets  = LBObservablePropertyObserverTargets
//fileprivate typealias Observer = LBObservablePropertyObserver
//
//extension LBObservableProperty {
//    // ============================================== //
//    // MARK: -
//    // ============================================== //
////    public func remove<Target: NSObject>(_ target: Target) {
////        observer.remove(target, self)
////    }
//
//    public func observe<Target: NSObject>(_ target: Target) -> LBObservablePropertyObserver<Value> {
//        return observer.observe(target, self)
//    }
//}
//
//extension _LBObservablePropertyObserver {
//    // ============================================== //
//    // MARK: -
//    // ============================================== //
//    fileprivate func observe<Target: NSObject>(_ target:   Target,
//                                               _ property: LBObservableProperty<Value>) -> Observer<Value> {
//        let observer = target.targets().get(target, property) ?? Observer()
//        return add(observer)
//    }
//
////    fileprivate func remove<Target: NSObject>(_ target:   Target,
////                                              _ property: LBObservableProperty<Value>) {
////        let targets  = target.targets()
////        let observer = targets.get(target, property) ?? Observer()
////        remove(observer)
////        targets.remove(target, property)
////    }
//}
//
//extension NSObject {
//    // ============================================== //
//    // MARK: -
//    // ============================================== //
//    fileprivate func targets() -> Targets {
//        let targets = withUnsafePointer(to: &initialObserverTargetsKey) {
//            if let objc = objc_getAssociatedObject(self, $0) {
//                return objc as! Targets
//            }
//            else {
//                objc_setAssociatedObject(self, $0, Targets(), .OBJC_ASSOCIATION_RETAIN)
//            }
//            return objc_getAssociatedObject(self, $0) as! Targets
//        }
//        return targets
//    }
//}








//class UILabelPropertyBindObject<Value: LBObservablePropertyValueType>: NSObject {
//
////    typealias Property = LBObservableProperty<Value>
//
//    fileprivate weak var label:    UILabel?  = nil
//    fileprivate weak var property: LBObservableProperty? = nil
//
////    internal init(_ label: UILabel, _ property: Property) {
////        super.init()
////        self.label    = label
////        self.property = property
////        self.observe()
////    }
//
//    deinit {
//        self.property?.remove(self)
//    }
//
//    internal func inject<Value: LBObservablePropertyValueType>(_ label: UILabel,
//                                                               _ property: LBObservableProperty<Value>) {
//
//    }
//}
//
//extension UILabelPropertyBindObject {
//    // ================================================== //
//    // MARK: -
//    // ================================================== //
//}
//
//extension UILabelPropertyBindObject {
//    // ================================================== //
//    // MARK: -
//    // ================================================== //
//    fileprivate func observe() {
//        self.property?.observe(self).onChange { [weak self] newValue in
//            self?.label?.text = "\(newValue)"
//        }
//    }
//}
//
////UILabelPropertyBindPool


//
////
////  _LBObservableObjectPool.swift
////  LBObservableObject
////
////  Created by ליעוז בלקי on 05/01/2024.
////
//
//import UIKit
//import Foundation
//
//internal class _LBObservableObjectPool {
//
//    typealias Storage = NSMapTable<NSString, NSMapTable<NSString, NSMapTable<NSString, LBObservableObject>>>
//
//    fileprivate static var storage: Storage = {
//        .init(keyOptions: .strongMemory, valueOptions: .strongMemory)
//    }()
//
//    fileprivate var storage: Storage {
//        get { Self.storage            }
//        set { Self.storage = newValue }
//    }
//
//    internal func remove(id: String, group: String, _ value: LBObservableObject) {
//        guard let storage = initializeIfNeeded(key: "\(value.class_name)-\(id)") else {
//            return
//        }
//        guard let map = initializeMapIfNeeded(storage: storage, group: group) else {
//            return
//        }
//        objc_sync_enter(map); defer { objc_sync_exit(map) }
//        map.removeObject(forKey: value.pointer_key.nsstringValue)
//    }
//
//    internal func append(id: String, group: String, _ value: LBObservableObject) {
//        guard let storage = initializeIfNeeded(key: "\(value.class_name)-\(id)") else {
//            return
//        }
//        guard let map = initializeMapIfNeeded(storage: storage, group: group) else {
//            return
//        }
//        objc_sync_enter(map); defer { objc_sync_exit(map) }
//        map.setObject(value, forKey: value.pointer_key.nsstringValue)
//    }
//
//    internal func get(id: String, group: String, _ value: LBObservableObject) -> [LBObservableObject] {
//        guard let storage = initializeIfNeeded(key: "\(value.class_name)-\(id)") else {
//            return []
//        }
//        guard let map = initializeMapIfNeeded(storage: storage, group: group) else {
//            return []
//        }
//        objc_sync_enter(map); defer { objc_sync_exit(map) }
//        return map.objectEnumerator()?.allObjects.compactMap { $0 as? LBObservableObject } ?? []
//    }
//}
//
//extension _LBObservableObjectPool {
//    // ================================================== //
//    // MARK: -
//    // ================================================== //
//    fileprivate func initializeIfNeeded(key: String) -> NSMapTable<NSString, NSMapTable<NSString, LBObservableObject>>? {
//        objc_sync_enter(storage); defer { objc_sync_exit(storage) }
//        guard storage.object(forKey: key.nsstringValue) == nil else {
//            return storage.object(forKey: key.nsstringValue)
//        }
//        storage.setObject(.init(keyOptions: .strongMemory, valueOptions: .strongMemory),
//                       forKey: key.nsstringValue)
//        return storage.object(forKey: key.nsstringValue)
//    }
//}
//
//extension _LBObservableObjectPool {
//    // ================================================== //
//    // MARK: -
//    // ================================================== //
//    fileprivate func initializeMapIfNeeded(storage: NSMapTable<NSString, NSMapTable<NSString, LBObservableObject>>,
//                                           group: String) -> NSMapTable<NSString, LBObservableObject>? {
//        objc_sync_enter(storage); defer { objc_sync_exit(storage) }
//        guard storage.object(forKey: group.nsstringValue) == nil else {
//            return storage.object(forKey: group.nsstringValue)
//        }
//        storage.setObject(.init(keyOptions: .strongMemory, valueOptions: .weakMemory), forKey: group.nsstringValue)
//        return storage.object(forKey: group.nsstringValue)
//    }
//}
//
//extension _LBObservableObjectPool {
//    // ================================================== //
//    // MARK: -
//    // ================================================== //
//    internal static var new: _LBObservableObjectPool {
//        return _LBObservableObjectPool()
//    }
//}


//var p1 = Post.Builder()
//    .set(id: "post-0")
//    .set(text: "post-1-text")
//    .build()
//
//var p0 = Post.Builder()
//    .set(id: "post-0")
//    .set(text: "post-0-text")
//    .build()
//
//p0.attach(id: p0.id, toGroup: "A")
//p1.attach(id: p1.id, toGroup: "B")
//
//p0.$text.observe(self).onChange { newValue in
//    print("p0 text = \(newValue)")
//}
//
//p1.$text.observe(self).onChange { newValue in
//    print("p1 text = \(newValue)")
//}
//
//p0.text = "lioz"
//p0.$text.post(toGroup: "B")
//
//print("")


//        if let b = b {
//            b.pointee {
//                print("b.pointee = \($0)")
//                print("")
//            }
//        }
//        Network.requsts.posts.delete(posts[indexPath.item])
//        posts.removeAll()//remove(at: indexPath.item)
        //posts.observe(self).post(toGroups: ["A", "B", "C", "D"])
        

//        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
//            self.posts.observe(self)
//        }






//        _posts.observe(self).onPosted {
//            print("")
//        }
//        .attach(toGroup: "A")
        
//        b = _LBUnsafeRawBufferPointer(&_posts)
//        b = withUnsafeMutableBytes(of: &_posts) {
//            return $0
//        }
//
//        if let b = b {
//////            var view  = UnsafeBufferView(reinterpret: b, as: [Post].self)
//////            var array = view.toArray()
////            print("")
////            b.pointee?.append(Post())
//        }
////
//        if let b = b {
//            print("")
//        }
        //_posts.append(Post())
        
//        if let b = b {
//            let view = UnsafeBufferView(reinterpret: b, as: [Post].self)
//            print("")
//        }
 
//        self.posts.observe(self).onPosted { [weak self] in
//            self?.collectionView.reloadData()
//        }
//        .attach(toGroup: group)

//
//struct UnsafeBufferView<Element>: RandomAccessCollection {
//    let rawBytes: UnsafeRawBufferPointer
//
//    var count: Int {
//        return rawBytes.count / MemoryLayout<Element>.stride
//    }
//
//    init(reinterpret rawBytes: UnsafeRawBufferPointer, as: Element.Type) {
//        self.rawBytes = rawBytes
////        self.count = rawBytes.count / MemoryLayout<Element>.stride
//        precondition(self.count * MemoryLayout<Element>.stride == rawBytes.count)
//        precondition(Int(bitPattern: rawBytes.baseAddress).isMultiple(of: MemoryLayout<Element>.alignment))
//    }
//
//    var startIndex: Int { 0 }
//
//    var endIndex: Int { count }
//
//    subscript(index: Int) -> Element {
//        rawBytes.load(fromByteOffset: index * MemoryLayout<Element>.stride, as: Element.self)
//    }
//
////    func toArray() -> UnsafeMutablePointer<Element>? {
////        let pointer = rawBytes.bindMemory(to: Element.self)
////        return pointer.baseAddress?.pointee//?.pointee
////    }
//}
//
////




//    var b: _LBUnsafeRawBufferPointer<[Post]>?
//    var v: UnsafeBufferView<UInt>?

//static var test: PointeeArray<Post>?

//var _posts   = [Post(), Post()]

//var _pointer = PointeeArray(&_posts)
////
//_posts.observe(self).onPosted {
//
//}
//.attach(toGroup: "A")
//
//PostsCollectionView.test = _pointer
//print("")
//
//class PointeeArray<E> {
//
//    internal var pointer: UnsafeMutablePointer<[E]>
//
//    internal var isNil: Bool {
//        return pointer.pointee as Optional<[E]> == nil
//    }
//
//    init(_ array: inout [E]) {
//        self.pointer = withUnsafeMutablePointer(to: &array, { $0 })
//    }
//}

//


//let p0 = Post.Builder()
//    .set(id: "0")
//    .set(text: "text-0")
//    .build()
//
//let p1 = Post.Builder()
//    .set(id: "0")
//    .set(text: "text-1")
//    .build()
//
//let p2 = Post.Builder()
//    .set(id: "0")
//    .set(text: "text-2")
//    .build()
//
//p0.attach(id: "0", toGroup: "A")
//p1.attach(id: "0", toGroup: "A")
//p2.attach(id: "0", toGroup: "B")
//
////        p0.attach(id: "0", toGroup: "A")
////        p0.attach(id: "0", toGroup: "A")
//
//p2.$text.post(toGroup: "A")
//print("")
//
//p0.text = "text-0"
//p1.text = "text-1"
//print("")
//
//p0.$text.post(toGroup: "A")
//print("")

//ObservableNSObject

//LBObservableNSObjectArray

//extension NSArray {
//    // ============================================== //
//    // MARK: -
//    // ============================================== //
//     internal var observe: LBObservableObjectArray? {
//         let pointer = withUnsafeMutablePointer(to: &initialLBObservableObjectArrayKey, { $0 })
//
//         if let objc = objc_getAssociatedObject(self, pointer) {
//             return objc as? LBObservableObjectArray
//         }
//         else {
//             objc_setAssociatedObject(self, pointer, LBObservableObjectArray(), .OBJC_ASSOCIATION_RETAIN)
//         }
//         return objc_getAssociatedObject(self, pointer) as? LBObservableObjectArray
//    }
//}
//
//class Test: NSArray {
//
//
//}




//
////public class LBObservableObjectArray<Element> {
////
//////    fileprivate var elements: LBObservableObjectArrayValue? = nil
//////    static var pool = []
////
//////    typealias Storage = NSMapTable<NSString, NSArray>
//////
//////    static var storage: Storage = {
//////        .init(keyOptions: .strongMemory, valueOptions: .weakMemory)
//////    }()
////
//////    public override init() {
//////        super.init()
//////    }
//////
////    internal init(_ elements: [Element]) {
////        //super.init()
//////        Self.storage.setObject(WeakContainer(value: elements), forKey: "lioz")
//////        print("")
////    }
////
////    @discardableResult public func attach(toGroup group: String) -> Self {
////        return self
////    }
////
////    @discardableResult public func onPosted(_ block: @escaping() -> Void) -> Self {
////        return self
////    }
////
////    deinit {
////        print("")
////    }
////}
//
////protocol LBObservableObjectArrayValue {
////
////}
////
////extension Array: LBObservableObjectArrayValue where Element: LBObservableObject {
////
////}
//
////public class LBObservableObjectArray {
////
////    var p: LBObservableObjectArrayProtocol?
////
////    init(_ values: LBObservableObjectArrayProtocol) {
////        self.p = values
////    }
////}
//
//// LBObservableArray
//
//@propertyWrapper class LBObservableArray<Value: LBObservableArrayValueType> {
//
//    internal var wrappedValue: Value {
//        didSet {
//            print("")
//        }
//    }
//
//    internal init(wrappedValue: Value) {
//        self.wrappedValue = wrappedValue
//    }
//
//    internal var projectedValue: LBObservableArray<Value> {
//        return self
//    }
//
////    internal func test() {
////        (wrappedValue as? Array<LBObservableObject>)?.append(Post())
////    }
//}
////
////
////
////
//protocol LBObservableArrayValueType {
//
//}
//
////extension Array where Self: LBObservableArrayValueType, Element: LBObservableObject {
////    internal mutating func append() {
////        self.append(<#T##newElement: Element##Element#>)
////    }
////}
//
//
//extension Array: LBObservableArrayValueType where Element: LBObservableObject {
//
//}
////
////
////
////
////
////
////
////
//////
//////protocol LBObservableObjectArrayProtocol {
//////
//////}
//////
//////extension Array: LBObservableObjectArrayProtocol {
//////
//////}
//////
////////@discardableResult func onChange(_ block: @escaping() -> Void) -> Self {
//////////        pointer.didSet(block)
////////    return self
////////}
////////
////////@discardableResult func attach(toGroup group: String) -> Self {
////////    return self
////////}
//////
////////
//////@propertyWrapper class LBObservablePropertyArray<Value> {
//////
//////    internal var wrappedValue: Value {
//////        didSet {
//////            print("")
//////        }
//////    }
//////
//////    internal init(wrappedValue: Value) {
//////        self.wrappedValue = wrappedValue
//////    }
//////}
//////
//////
//////
////////
////////
//////////protocol LBObservablePropertyArrayP {
//////////
//////////
//////////}
//////////
//////////
//////////extension Array: LBObservablePropertyArrayP where Element: LBObservableObject {
//////////
//////////
//////////}
////////
////////
////////
////////
//////////class LBObservablePointerArray<E> {
//////////
//////////    internal var array:   [E]
//////////    internal var pointer: UnsafeMutablePointer<[E]>
//////////
//////////
//////////    init(_ array: inout [E]) {
//////////        self.array = array
//////////        self.pointer = withUnsafeMutablePointer(to: &array, { $0 })
//////////    }
//////////
//////////    fileprivate func didSet(_ newValue: [E]) {
//////////
//////////    }
//////////
//////////    @discardableResult func didSet(_ callback: @escaping() -> Void) -> Self {
//////////        // observe.didSet("\(pointer)", callback)
//////////        return self
//////////    }
//////////}
//////////



















//    var post0 = Post(image: Image(id: "image-1", group: "A", value: "lioz1"),
//                     video: Video(id: "video-1", group: "A", value: "lioz1"), text: "lioz1")
//
//    var post1 = Post(image: Image(id: "image-1", group: "B", value: "lioz2"),
//                     video: Video(id: "video-1", group: "B", value: "lioz2"), text: "lioz2")
//
//    var post2 = Post(image: Image(id: "image-1", group: "C", value: "lioz3"),
//                     video: Video(id: "video-1", group: "C", value: "lioz3"), text: "lioz3")
//




//        for i in 0..<2 {
//            let post   = Post()
//            let image  = Image()
//            let member = Member()
//
//            post.id   = "post-\(i)"
//            post.text = "lioz-\(i)"
//
//            image.id    = "image-\(i)"
//            image.value = "some image"
//
//            member.id   = "member-\(i)"
//            member.name = "lioz"
//
//            post.image  = image
//            post.member = member
//
//            Network.requsts.posts.put(post)
//        }
//
//
//
////
////        post0.attach(id: "post-1", toGroup: "A")
////        post1.attach(id: "post-1", toGroup: "B")
////        post2.attach(id: "post-1", toGroup: "C")
////
////        print("post0 text = \(post0.text), post1 text = \(post1.text), post2 text = \(post2.text)")
////
////        post0.$text.post(toGroup: "B")
////
////        print("post0 text = \(post0.text), post1 text = \(post1.text), post2 text = \(post2.text)")
////
////        post0.image.$value.post(toGroup: "B")
//
////        post0.image.copy(from: post1.image)
//        print("")
//
//        //JSON.write(["lioz": "kk"])
////        JSON.write_template()
////        JSON.getAll()
////
////        JSON.write_template("lioz")
////        JSON.getAll()
////
////        JSON.write_template()
////        JSON.getAll()
//
////        JSON.retrieveFromJsonFile()
///

//
////_LBObservableObjectObserver
//
//enum KeyValueObservation<T> {
//    case initial(T)
//    case notInitial(old: T, new: T)
//
//    /// Sets self to `.initial` if there is exactly one element in the array.
//    /// Sets self to `.notInitial` if there are two or more elements in the array.
//    /// Otherwise, the initializer fails.
//    ///
//    /// - Parameter values: An array of values to initialize with.
//    init?(_ values: [T]) {
//        if values.count == 1, let value = values.first {
//            self = .initial(value)
//        } else if let old = values.first, let new = values.last {
//            self = .notInitial(old: old, new: new)
//        } else {
//            return nil
//        }
//    }
//}
//
//extension NSObjectProtocol where Self: NSObject {
//
//    /// Publishes `KeyValueObservation` values when the value identified
//    /// by a KVO-compliant keypath changes.
//    ///
//    /// - Parameter keyPath: The keypath of the property to publish.
//    /// - Returns: A publisher that emits `KeyValueObservation` elements each
//    ///            time the property’s value changes.
//    func keyValueObservationPublisher<Value>(for keyPath: KeyPath<Self, Value>)
//        -> AnyPublisher<KeyValueObservation<Value>, Never> {
//
//        // Gets a built-in KVO publisher for the property at `keyPath`.
//        //
//        // We specify all the options here so that we get the most information
//        // from the observation as possible.
//        //
//        // We especially need `.prior`, which makes it so the publisher fires
//        // the previous value right before any new value is set to the property.
//        //
//        // `.old` doesn't seem to make any difference, but I'm including it
//        // here anyway for no particular reason.
//        let kvoPublisher = publisher(for: keyPath,
//                                     options: [.initial, .new, .old, .prior])
//
//        // Makes a publisher for just the initial value of the property.
//        //
//        // Since we specified `.initial` above, the first published value will
//        // always be the initial value, so we use `first()`.
//        //
//        // We then map this value to a `KeyValueObservation`, which in this case
//        // is `KeyValueObservation.initial` (see the initializer of
//        // `KeyValueObservation` for why).
//        let publisherOfInitialValue = kvoPublisher
//            .first()
//            .compactMap { KeyValueObservation([$0]) }
//
//        // Makes a publisher for every non-initial value of the property.
//        //
//        // Since we specified `.initial` above, the first published value will
//        // always be the initial value, so we ignore that value using
//        // `dropFirst()`.
//        //
//        // Then, after the first value is ignored, we wait to collect two values
//        // so that we have an "old" and a "new" value for our
//        // `KeyValueObservation`. This works because we specified `.prior` above,
//        // which causes the publisher to emit the value of the property
//        // _right before_ it is set to a new value. This value becomes our "old"
//        // value, and the next value emitted becomes the "new" value.
//        // The `collect(2)` function puts the old and new values into an array,
//        // with the old value being the first value and the new value being the
//        // second value.
//        //
//        // We then map this array to a `KeyValueObservation`, which in this case
//        // is `KeyValueObservation.notInitial` (see the initializer of
//        // `KeyValueObservation` for why).
//        let publisherOfTheRestOfTheValues = kvoPublisher
//            .dropFirst()
//            .collect(2)
//            .compactMap { KeyValueObservation($0) }
//
//        // Finally, merge the two publishers we created above
//        // and erase to `AnyPublisher`.
//        return publisherOfInitialValue
//            .merge(with: publisherOfTheRestOfTheValues)
//            .eraseToAnyPublisher()
//    }
//}
//
//
////
//extension String {
//
//    /// Ignore this. This is just used to make the example output above prettier.
//    var quoted: String { "\"\(self)\"" }
//}
////
////
////class ViewController: UIViewController {
////
////    /// The property we want to observe using our KVO publisher.
////    ///
////    /// Note that we need to make this visible to Objective-C with `@objc` and
////    /// to make it work with KVO using `dynamic`, which means the type of this
////    /// property must be representable in Objective-C. This one works because it's
////    /// a `String`, which has an Objective-C counterpart, `NSString *`.
////    @objc dynamic private var myProperty: String?
////
////    /// The thing we have to hold on to to cancel any further publications of any
////    /// changes to the above property when using something like `sink`, as shown
////    /// below in `viewDidLoad`.
////    private var cancelToken: AnyCancellable?
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////
////        // Before this call to `sink` even finishes, the closure is executed with
////        // a value of `KeyValueObservation.initial`.
////        // This prints: `Initial value of myProperty: nil` to the console.
////        cancelToken = keyValueObservationPublisher(for: \.myProperty).sink {
////            switch $0 {
////            case .initial(let value):
////                print("Initial value of myProperty: \(value?.quoted ?? "nil")")
////
////            case .notInitial(let oldValue, let newValue):
////                let oldString = oldValue?.quoted ?? "nil"
////                let newString = newValue?.quoted ?? "nil"
////                print("myProperty did change from \(oldString) to \(newString)")
////            }
////        }
////
////        // This prints:
////        // `myProperty did change from nil to "First value"`
////        myProperty = "First value"
////
////        // This prints:
////        // `myProperty did change from "First value" to "Second value"`
////        myProperty = "Second value"
////
////        // This prints:
////        // `myProperty did change from "Second value" to "Third value"`
////        myProperty = "Third value"
////
////        // This prints:
////        // `myProperty did change from "Third value" to nil`
////        myProperty = nil
////    }
////}







//        var p = withUnsafeMutablePointer(to: &self.posts, { $0 }).pointee
//        p.append(Post())
//        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
//            self.p.array.append(Post())
//            print("")
//        }
//
        
//        _posts.observe
//        $posts.test()
//        print("")
//        LBObservableObjectArray.storage.setObject(_posts as NSArray, forKey: "lioz")
//
//
//        _posts.append(Post())
//        print("")
////
        
        //self.posts.observe
//

//class PointeeArray<E> where E: LBObservableObject {
//
////    fileprivate var pointer: UnsafeMutablePointer<[E]>
////    fileprivate var pointee: [E]
//
//    internal var array: [E] = [] {
//        didSet {
//            print("")
//        }
//    }
//
////    var buffer: UnsafeMutableRawBufferPointer?
//
//    init(_ array: inout [E]) {
//
//        let view = array.withUnsafeBytes {
//            UnsafeBufferView(reinterpret: $0, as: E.self)
//        }
//
//        print("")
//        array.append(Post() as! E)
//
//        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
//            print("view count = \(view.count)")
//            print("")
//        }
////        var _array = [E]()
////
////        self.array.append(contentsOf: _array)
////        array = self.array
//
////        self.array.append(Post() as! E)
////        print("")
////        self.pointer = withUnsafeMutablePointer(to: &array, { $0 })
////        self.pointee = self.pointer.pointee
////        self.pointee.append(E())
//
//
////        ///testContainer(numValues: 5)
////        testBufferView()
//
////        var myClass   = MyClass()
////        let rawPtr    = UnsafeMutableRawPointer(&myClass)
////        let rawPtr2   = myClass.ptrToSelf()                 // just to log, not used
////        let classPtr  = rawPtr.bindMemory(to: MyClass.self, capacity: 1)
////        let classPtr2 = rawPtr2.bindMemory(to: MyClass.self, capacity: 1)
////
////        classPtr.pointee.doSometing()
////
////        regression.add(function: f)
////        regression.add(key: \MutableData.varA)
////        regression.add(key: \MutableData.varB)
////        regression.fit(to: &mutableData)
//
//
//    }
//}
//
//
//
//
//
////class MyClass {
////    func doSometing() {
////        print("I'm trying.")
////    }
////
////    func ptrToSelf() -> UnsafeMutableRawPointer {
////        return Unmanaged.passUnretained(self).toOpaque()
////    }
////}
////
////struct UnsafeBufferView<Element>: RandomAccessCollection {
////
////    var rawBytes: UnsafeRawBufferPointer?
////
////    var count: Int {
////        guard let rawBytes = rawBytes else {
////            return .zero
////        }
////        return rawBytes.count / MemoryLayout<Element>.stride
////    }
////
////    init(reinterpret rawBytes: UnsafeRawBufferPointer, as: Element.Type) {
////        self.rawBytes = rawBytes
////        //self.count = rawBytes.count / MemoryLayout<Element>.stride
////        precondition(self.count * MemoryLayout<Element>.stride == rawBytes.count)
////        precondition(Int(bitPattern: rawBytes.baseAddress).isMultiple(of: MemoryLayout<Element>.alignment))
////    }
////
////    var startIndex: Int { 0 }
////
////    var endIndex: Int {
////        count
////    }
////
////    subscript(index: Int) -> Element? {
////        rawBytes?.load(fromByteOffset: index * MemoryLayout<Element>.stride, as: Element.self)
////    }
////}
////











//

//LBObservablePropertyArray
//LBObservablePropertyObject
//LBObservableArrayAssociated

//    fileprivate var boundsObservation: NSKeyValueObservation?








//    func keyValueObservationPublisher<Value>(for keyPath: KeyPath<LBObservableObject, Value>) {
//
//    }
//    subscript<T>(dynamicMember member: KeyPath<LBObservableObject, T>) -> T? {
//       return 0 as! T //referred?[keyPath: member]
//   }
    
//    @preconcurrency public subscript<K>(dynamicMember keyPath: KeyPath<AttributeDynamicLookup, K>) -> K.Value? where K : AttributedStringKey, K.Value : Sendable


//extension LBObservableObject where Self: NSObject {
//
//}

//extension NSObjectProtocol where Self: LBObservableObject {
//
//    func keyValueObservationPublisher<Value>(for keyPath: KeyPath<Self, Value>) {
//
////        let publisherOfInitialValue = kvoPublisher
////            .first()
////            .compactMap { KeyValueObservation([$0]) }
//
//        let label = keyPath.label//self[keyPath: keyPath]
//
////        print("")
////        boundsObservation = observe(keyPath, options: [.new, .old]) { s, change in
////            print("rere")
////        }
//    }
//}
//
//extension KeyPath {
//    // ================================================= //
//    // MARK: -
//    // ================================================= //
//    var label: String {
//        return "_" + ("\(self)".components(separatedBy: ".").last ?? "")
//    }
//}



