//
//  Constants.swift
//  Aisle
//
//  Created by Shivam Maurya on 06/11/24.
//

import Foundation

let baseUrl = "https://app.aisle.co/V1"

let phoneNumber_Url = baseUrl+"/users/phone_number_login"
let otp_Url = baseUrl+"/users/verify_otp"
let notes_Url = baseUrl+"/users/test_profile_list"

let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let NoInternetMsg = "The internet connection appears to be offline"

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
