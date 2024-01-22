//
//  LBObservableObject+Typealias.swift
//  LBObservableObject
//
//  Created by ליעוז בלקי on 16/01/2024.
//

import UIKit
import Foundation

/*
 * MARK: ->
 * */
public typealias LBArray = LBObservableArray

/*
 * MARK: ->
 * */
public typealias LBObject = LBObservableObject

/*
 * MARK: ->
 * */
public typealias LBArrayObserver = LBObservableArrayObserver

/*
 * MARK: ->
 * */
public typealias LBPropertyBindInt = LBObservablePropertyBindAny<Int>

/*
 * MARK: ->
 * */
public typealias LBPropertyBindFont = LBObservablePropertyBindAny<UIFont>

/*
 * MARK: ->
 * */
public typealias LBPropertyBindString = LBObservablePropertyBindAny<String>

/*
 * MARK: ->
 * */
public typealias LBPropertyBindText = LBObservablePropertyBindAny<String>

/*
 * MARK: ->
 * */
public typealias LBPropertyBindImage = LBObservablePropertyBindAny<UIImage>

/*
 * MARK: ->
 * */
public typealias LBPropertyBindBool = LBObservablePropertyBindAny<Bool>


/*
 * MARK: ->
 * */
public typealias LBPropertyBindColor = LBObservablePropertyBindAny<UIColor>

/*
 * MARK: ->
 * */
public typealias LBPropertyBindCGFloat = LBObservablePropertyBindAny<CGFloat>

/*
 * MARK: ->
 * */
public typealias LBPropertyBindButtonRole = LBObservablePropertyBindAny<UIButton.Role>
/*
 * MARK: ->
 * */
public typealias LBPropertyBindTextAlignment = LBObservablePropertyBindAny<NSTextAlignment>

/*
 * MARK: ->
 * */
public typealias LBPropertyBindBaselineAdjustment = LBObservablePropertyBindAny<UIBaselineAdjustment>

/*
 * MARK: ->
 * */
public typealias LBPropertyBindTintAdjustmentMode = LBObservablePropertyBindAny<UIView.TintAdjustmentMode>

/*
 * MARK: ->
 * */
@available(iOS 16.0, *)
public typealias LBPropertyBindElementOrder = LBObservablePropertyBindAny<UIContextMenuConfiguration.ElementOrder>

