//
//  GlobelFunctions.swift
//  Aisle
//
//  Created by Shivam Maurya on 06/11/24.
//


import UIKit
import SystemConfiguration

class GlobelFunctions: NSObject {
    
    //MARK: Convert Hex Color Code To UIColor
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func isConnectedToInternet() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
        
    }
    
    class func showAlert(title: String, withMessage message: String, completion: (() -> Void)? = nil) {
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let okAction = UIAlertAction(title: "OK", style: .default) { _ in
             completion?()
         }
         alert.addAction(okAction)
        if let topController = UIApplication.topViewController()
        {
            if !(topController is UIAlertController) {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                    topController.present(alert, animated: true, completion: nil)
                }
                
               
            }
            
            
        }
     }
    
    class  func isKeyPresentInUserDefaults(key: String) -> Bool {
        
        return UserDefaults.standard.object(forKey: key) != nil
    }
}
