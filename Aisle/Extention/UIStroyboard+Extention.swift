//
//  UIStroyboard+Extention.swift
//  Aisle
//
//  Created by Shivam Maurya on 06/11/24.
//

import UIKit

extension UIStoryboard {
    
    static let Main = UIStoryboard(name: "Main", bundle: nil)
    
    static func getAPhoneNumberVC() -> APhoneNumberVC {
        let vc = Main.instantiateViewController(withIdentifier: "APhoneNumberVC") as! APhoneNumberVC
        return vc
    }
    
    static func getAOTPVC() -> AOTPVC {
        let vc = Main.instantiateViewController(withIdentifier: "AOTPVC") as! AOTPVC
        return vc
    }

    static func getANoteVC() -> ANoteVC {
        let vc = Main.instantiateViewController(withIdentifier: "ANoteVC") as! ANoteVC
        return vc
    }
    
    static func getHomeVC() -> AHomeVC {
        let vc = Main.instantiateViewController(withIdentifier: "AHomeVC") as! AHomeVC
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

extension String {
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }

    func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "")
    }
  }

extension Blurable where Self: UIView {
    func addBlur(_ alpha: CGFloat = 0.99) {
        // create effect
        let effect = UIBlurEffect(style: .systemThinMaterialDark)
        let effectView = UIVisualEffectView(effect: effect)
        
        // set boundry and alpha
        effectView.frame = self.bounds
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        effectView.alpha = alpha
        
        self.addSubview(effectView)
    }
    
    func removeBlur() {
           self.subviews
               .filter { $0 is UIVisualEffectView }
               .forEach { $0.removeFromSuperview() }
       }
}
