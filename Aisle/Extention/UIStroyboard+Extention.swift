//
//  UIStroyboard+Extention.swift
//  Aisle
//
//  Created by Shivam Maurya on 06/11/24.
//

import UIKit

extension UIStoryboard {
    
    static let Main = UIStoryboard(name: "Main", bundle: nil)
    
    static func getAOTPVC() -> AOTPVC {
        let vc = Main.instantiateViewController(withIdentifier: "AOTPVC") as! AOTPVC
        return vc
    }
    
    static func getANoteVC() -> ANoteVC {
        let vc = Main.instantiateViewController(withIdentifier: "ANoteVC") as! ANoteVC
        return vc
    }
    
}

extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
