//
//  LBObservableArray.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 11/01/2024.
//

import UIKit
import Foundation

public class LBObservableArray<Element: LBObservableObject>: ExpressibleByArrayLiteral, Sequence {
    
    internal var elements: [Element] {
        didSet { }
    }
    
    public var count: Int {
        return elements.count
    }
    
    public var last: Element? {
        return elements.last
    }
    
    public var first: Element? {
        return elements.first
    }
    
    internal var pointer_key: String {
        return "\(Unmanaged.passUnretained(self).toOpaque())"
    }
    
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    public subscript(index: Int) -> Element? {
        get { elements[index] }
    }
    
    public subscript(index: Int) -> Element {
        get { elements[index] } set { elements[index] = newValue }
    }
    
    public subscript(bounds: Range<Int>) -> ArraySlice<Element> {
        get { elements[bounds] } set { elements[bounds] = newValue }
    }
    
    public subscript(x: (UnboundedRange_) -> ()) -> ArraySlice<Element> {
        get { elements[x] }
    }
    
    public subscript<R>(r: R) -> ArraySlice<Element> where R : RangeExpression, Int == R.Bound {
        get { elements[r] }
    }
    
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    public required convenience init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
    public init(_ elements: [Element]) {
        self.elements = Array(elements)
    }
    
    public convenience init() {
        self.init([])
    }
    
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    public static func ==(lhs: LBObservableArray, rhs: LBObservableArray) -> Bool {
        return lhs.elements == rhs.elements
    }
    
    public static func +=(lhs: inout LBObservableArray, rhs: LBObservableArray) {
        lhs.elements.append(contentsOf: rhs.elements)
    }
    
    public static func +(lhs: inout LBObservableArray, rhs: LBObservableArray) {
        lhs.elements.append(contentsOf: rhs.elements)
    }
    
    public static func +=(lhs: inout LBObservableArray, rhs: [Element]) {
        lhs.elements.append(contentsOf: rhs)
    }
    
    public static func +(lhs: inout LBObservableArray, rhs: [Element]) {
        lhs.elements.append(contentsOf: rhs)
    }
}

extension LBObservableArray {
    // ===================================================== //
    // MARK: -
    // ===================================================== //
    @discardableResult public func popLast() -> Element? {
        elements.popLast()
    }
    
    @discardableResult public func removeLast() -> Element {
        elements.removeLast()
    }
    
    @discardableResult public func removeFirst() -> Element {
        elements.removeFirst()
    }
    
    @discardableResult public func remove(at index: Int) -> Element {
        elements.remove(at: index)
    }
}

extension LBObservableArray {
    // ===================================================== //
    // MARK: -
    // ===================================================== //
    public func append(_ newElement: Element) {
        elements.append(newElement)
    }
    
    public func insert(_ newElement: Element, at i: Int) {
        elements.insert(newElement, at: i)
    }
    
    public func append(contentsOf newElements: [Element]) {
        elements.append(contentsOf: newElements)
    }
        
    public func removeAll(keepingCapacity keepCapacity: Bool = false) {
        elements.removeAll(keepingCapacity: keepCapacity)
    }
}

extension LBObservableArray {
    // ===================================================== //
    // MARK: -
    // ===================================================== //
    public func forEach(_ body: (Element) -> Void) {
        elements.forEach(body)
    }
    
    public func map<T>(_ transform: (Element) -> T) -> [T] {
        elements.map(transform)
    }
    
    public func filter(_ isIncluded: (Element) -> Bool) -> [Element] {
        elements.filter(isIncluded)
    }
    
    public func first(where predicate: (Element) -> Bool) -> Element? {
        elements.first(where: predicate)
    }
    
    public func firstIndex(where predicate: (Element) -> Bool) -> Int? {
        elements.firstIndex(where: predicate)
    }
    
    public func firstIndex(of element: Element) -> Int? where Element: Equatable {
        elements.firstIndex(of: element)
    }
    
    public func compactMap<Result>(_ transform: (Element) -> Result?) -> [Result] {
        elements.compactMap(transform)
    }
}

extension LBObservableArray: CustomStringConvertible, CustomDebugStringConvertible {
    // ================================================================= //
    // MARK: -
    // ================================================================= //
    public var description: String {
        elements.description
    }
    
    public var debugDescription: String {
        elements.debugDescription
    }
}

extension LBObservableArray: RandomAccessCollection, MutableCollection {
    
    public typealias Index    = Int
    public typealias Indices  = Range<Int>
    public typealias Iterator = IndexingIterator<LBObservableArray>
    
    @inlinable
    public var startIndex: Int {
        return .zero
    }
    
    @inlinable
    public var endIndex: Int {
        return count
    }
    
    @inlinable
    public func index(after i: Int) -> Int {
        return i + 1
    }
    
    @inlinable
    public func formIndex(after i: inout Int) {
        i += 1
    }
    
    @inlinable
    public func index(before i: Int) -> Int {
        return i - 1
    }
    
    @inlinable
    public func formIndex(before i: inout Int) {
        i -= 1
    }
    
    @inlinable
    public func distance(from start: Int, to end: Int) -> Int {
        return end - start
    }
    
    
    @inlinable
    public func index(_ i: Int, offsetBy distance: Int) -> Int {
        return i + distance
    }
    
    @inlinable
    public func index(_ i: Int, offsetBy distance: Int, limitedBy limit: Int) -> Int? {
        let l = limit - i
        if distance > 0 ? l >= 0 && l < distance : l <= 0 && distance < l {
            return nil
        }
        return i + distance
    }
}
