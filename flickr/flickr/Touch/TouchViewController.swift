//
//  TouchViewController.swift
//  flickr
//
//  Created by Daniel Kong on 4/19/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import UIKit
// url String create JSON data and model
class FAPIService: NSObject {
    static let shared = APIService()
    
    func fetchData(_ urlString: String, completion: @escaping (Data?, String?)->() ) {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                if error != nil {
                    completion(nil, error.debugDescription)
                }
                if let data = data, let response = response as? HTTPURLResponse {
                    if response.statusCode >= 200 && response.statusCode <= 299 {
                        print(response.statusCode)
                        completion(data, nil)
                    } else {
                        print("wrong")
                    }
                }
            }).resume()
        } else {
            print("wrong url string")
        }
    }
}

// Image cache, and download
let lyftImageCache = NSCache<NSString, AnyObject>()

class LyftImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(_ urlString: String) {
        imageUrlString = urlString
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage as? UIImage
            return
        }
        
        APIService.shared.fetchData(urlString: urlString) { data, errorString in
            if errorString != nil {
                return
            }
            if let data = data {
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        imageCache.setObject(image, forKey: urlString as NSString)
                        if self.imageUrlString == urlString {
                            self.image = image
                        }
                    }
                }
            }
        }
    }
}
/** or save it into file
 // Create path.
 let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
 let filePath = "\(paths[0])/MyImageName.png"
 
 // Save image.
 UIImagePNGRepresentation(image)?.writeToFile(filePath, atomically: true)
 */

class TouchViewController: UIViewController {
    var touchView = UIImageView()
    var location = CGPoint(x: 0, y: 0)
    var viewsArray = [UIView]()
    
    override func viewDidLoad() {
        let urlString = "https://farm1.staticflickr.com/842/40852556434_cb65113f1a.jpg"
        FAPIService.shared.fetchData(urlString: urlString, completion: { data, errorString in
            if errorString != nil {
                print(errorString)
            }
            if let data = data {
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        self.touchView.image = image
                    }
                }
            }
        })
        
        touchView.backgroundColor = .lightGray
        touchView.frame = CGRect.init(x: 150, y: 150, width: 80, height: 80)
        view.backgroundColor = .white
        
        let view1 = UIView.init(frame: CGRect.init(x: 50, y: 150, width: 80, height: 80))
        view1.layer.borderColor = UIColor.lightGray.cgColor
        view1.layer.borderWidth = 2
        let view2 = UIView.init(frame: CGRect.init(x: 150, y: 250, width: 180, height: 180))
        view2.layer.borderColor = UIColor.orange.cgColor
        view2.layer.borderWidth = 2
        let view3 = UIView.init(frame: CGRect.init(x: 150, y: 150, width: 100, height: 280))
        view3.layer.borderColor = UIColor.blue.cgColor
        view3.layer.borderWidth = 2
        let view4 = UIView.init(frame: CGRect.init(x: 250, y: 150, width: 80, height: 80))
        view4.layer.borderColor = UIColor.green.cgColor
        view4.layer.borderWidth = 2
        let view5 = UIView.init(frame: CGRect.init(x: 350, y: 150, width: 80, height: 80))
        view5.layer.borderColor = UIColor.purple.cgColor
        view5.layer.borderWidth = 2

        viewsArray.append(view1)
        viewsArray.append(view2)
        viewsArray.append(view3)
        viewsArray.append(view4)
        viewsArray.append(view5)
        
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        view.addSubview(view4)
        view.addSubview(view5)
        
        view.addSubview(touchView)
    }

    /**
         public func insetBy(dx: CGFloat, dy: CGFloat) -> CGRect
         public var integral: CGRect { get }
         public func union(_ r2: CGRect) -> CGRect
         public func intersection(_ r2: CGRect) -> CGRect
         public func offsetBy(dx: CGFloat, dy: CGFloat) -> CGRect
         public func contains(_ point: CGPoint) -> Bool
         public func contains(_ rect2: CGRect) -> Bool
         public func intersects(_ rect2: CGRect) -> Bool
         public var dictionaryRepresentation: CFDictionary { get }
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        reset(viewsArray)
        for touch in touches {
            location = touch.location(in: view)
            touchView.center = location
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            location = touch.location(in: view)
            touchView.center = location
            
            for item in viewsArray {
                if item.frame.intersects(touchView.frame) {
                    item.backgroundColor = .green
                } else {
                    item.backgroundColor = .clear
                }
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            location = touch.location(in: view)
            for onview in viewsArray {
                if onview.frame.intersects(touchView.frame) {
                    onview.backgroundColor = .blue
                } else {
                    onview.backgroundColor = .clear
                }
            }
        }
    }
    
    func reset(_ views: [UIView]) {
        for test in viewsArray {
            test.backgroundColor = .clear
        }
    }
    /**
    UITouch
     public enum UITouchType : Int {
     
     
     case direct // A direct touch from a finger (on a screen)
     
     case indirect // An indirect touch (not a screen)
     
     @available(iOS 9.1, *)
     case stylus // A touch from a stylus
     }
     
     @available(iOS 9.1, *)
     public struct UITouchProperties : OptionSet {
     
     public init(rawValue: Int)
     
     
     public static var force: UITouchProperties { get }
     
     public static var azimuth: UITouchProperties { get }
     
     public static var altitude: UITouchProperties { get }
     
     public static var location: UITouchProperties { get } // For predicted Touches
     }
     
     UIEvent
     //
     //  UIEvent.h
     //  UIKit
     //
     //  Copyright (c) 2005-2017 Apple Inc. All rights reserved.
     //
     
     public enum UIEventType : Int {
     
     
     case touches
     
     case motion
     
     case remoteControl
     
     @available(iOS 9.0, *)
     case presses
     }
     
     public enum UIEventSubtype : Int {
     
     
     // available in iPhone OS 3.0
     case none
     
     
     // for UIEventTypeMotion, available in iPhone OS 3.0
     case motionShake
     
     
     // for UIEventTypeRemoteControl, available in iOS 4.0
     case remoteControlPlay
     
     case remoteControlPause
     
     case remoteControlStop
     
     case remoteControlTogglePlayPause
     
     case remoteControlNextTrack
     
     case remoteControlPreviousTrack
     
     case remoteControlBeginSeekingBackward
     
     case remoteControlEndSeekingBackward
     
     case remoteControlBeginSeekingForward
     
     case remoteControlEndSeekingForward
     }
     
     @available(iOS 2.0, *)
     open class UIEvent : NSObject {
     
     
     @available(iOS 3.0, *)
     open var type: UIEventType { get }
     
     @available(iOS 3.0, *)
     open var subtype: UIEventSubtype { get }
     
     
     open var timestamp: TimeInterval { get }
     
     
     open var allTouches: Set<UITouch>? { get }
     
     
     open func touches(for window: UIWindow) -> Set<UITouch>?
     
     open func touches(for view: UIView) -> Set<UITouch>?
     
     @available(iOS 3.2, *)
     open func touches(for gesture: UIGestureRecognizer) -> Set<UITouch>?
     
     
     // An array of auxiliary UITouch’s for the touch events that did not get delivered for a given main touch. This also includes an auxiliary version of the main touch itself.
     @available(iOS 9.0, *)
     open func coalescedTouches(for touch: UITouch) -> [UITouch]?
     
     
     // An array of auxiliary UITouch’s for touch events that are predicted to occur for a given main touch. These predictions may not exactly match the real behavior of the touch as it moves, so they should be interpreted as an estimate.
     @available(iOS 9.0, *)
     open func predictedTouches(for touch: UITouch) -> [UITouch]?
     }
     */
    
    /** version 2.0
    var tempMoveOnViews = Set<UIView>()
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        location = touch.location(in: view)
        touchView.center = location
        
        for test in viewsArray {
            print(test)
            if test.frame.intersects(touchView.frame) {
                test.backgroundColor = .green
                tempMoveOnViews.insert(test)
            } else {
                test.backgroundColor = .clear
                tempMoveOnViews.remove(test)
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch end")
        let touch = touches.first!
        location = touch.location(in: view)
        for onview in tempMoveOnViews {
            if onview.frame.intersects(touchView.frame) {
                onview.backgroundColor = .blue
            } else {
                onview.backgroundColor = .clear
            }
        }

    }
    
    func reset(_ views: [UIView]) {
        for test in tempMoveOnViews {
            test.backgroundColor = .clear
        }
    }
 */
    
    
}
