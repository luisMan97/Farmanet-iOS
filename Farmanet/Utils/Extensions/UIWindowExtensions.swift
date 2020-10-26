//
//  UIWindowExtensions.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 25/10/20.
//

import UIKit

extension UIWindow {
    
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
}
