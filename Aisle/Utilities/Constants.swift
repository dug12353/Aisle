//
//  Constants.swift
//  Aisle
//
//  Created by Shivam Maurya on 06/11/24.
//

import Foundation

let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let SCREEN_WIDTH = UIScreen.main.bounds.size.width

struct Device {
    static let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
    static let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone
}

struct Orientation {
    // indicate current device is in the LandScape orientation
    static var isLandscape: Bool {
        get {
            return UIDevice.current.orientation.isValidInterfaceOrientation
                ? UIDevice.current.orientation.isLandscape
                : UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
    // indicate current device is in the Portrait orientation
    static var isPortrait: Bool {
        get {
            return UIDevice.current.orientation.isValidInterfaceOrientation
                ? UIDevice.current.orientation.isPortrait
                : UIApplication.shared.statusBarOrientation.isPortrait
        }
    }
}

public func ShowHUD()
{
    
    
    let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    if(window != nil){
       MBProgressHUD.showAdded(to: (window)!, animated: false)
    }
    
}

public func RemoveHUD()
{
  //  let appDelegate1 = UIApplication.shared.delegate as! AppDelegate
    
     let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    
    if(window != nil){
        MBProgressHUD.hide(for: (window)!, animated: true)
    }
  
}
