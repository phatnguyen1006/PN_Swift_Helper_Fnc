import Foundation
import UIKit

public class Appearance {
    public static var tint: UIColor = {
        if #available(iOS 13, *) {
                return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                    if UITraitCollection.userInterfaceStyle == .dark {
                        /// Return the color for Dark Mode
                        return UIColor.white
                    } else {
                        /// Return the color for Light Mode
                        return UIColor.black
                    }
                }
            } else {
                /// Return a fallback color for iOS 12 and lower.
                return UIColor.black
            }
    }()
}
