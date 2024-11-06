//
//  FontType.swift
//  Aisle
//
//  Created by Shivam Maurya on 06/11/24.
//


import Foundation
import UIKit

public enum FontType: String {
    case Inter_Bold
    case Inter_Regular
    case Inter_SemiBold

}

extension UIFont {
    static func customFont(type pFontType: FontType, size pSize: CGFloat) -> UIFont {
        var aReturnVal = UIFont.systemFont(ofSize: pSize)
        
        switch pFontType {
        case .Inter_Bold:
            if let aFont = UIFont(name: "Inter-Bold", size: pSize) {
                aReturnVal = aFont
            }
        case .Inter_Regular:
            if let aFont = UIFont(name: "Inter_Regular", size: pSize) {
                aReturnVal = aFont
            }
        case .Inter_SemiBold:
            if let aFont = UIFont(name: "Inter-SemiBold", size: pSize) {
                aReturnVal = aFont
            }
            
        }
        
        return aReturnVal
    }
}

