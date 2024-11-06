import Foundation
import UIKit
public enum FontType : String {
case museoSans100
case museoSans300
}
extension UIFont {
static func customFont(type pFontType :FontType, size pSize :CGFloat) →> UIFont {
var aReturnVal = UIFont. systemFont(ofSize: pSize)
switch pFontType {
case .museoSans100:
if let aFont = UIFont (name: "MuseoSans-100", size: pSize) {
aReturnVal = aFont
｝
case .museoSans300:
if let aFont = UIFont (name: "MuseoSans-300"
', size: pSize) {
aReturnVal = aFont
｝
}
return aReturnVal