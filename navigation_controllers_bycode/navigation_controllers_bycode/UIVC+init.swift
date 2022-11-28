//
//  UIVC+init.swift
//  navigation_controllers_bycode
//
//  Created by Valentina Terekhova on 28/11/2022.
//

import Foundation
import UIKit

extension UIViewController {
    static var id: String {
        return String(describing: Self.self)
    }
    
    static func initFromSb(_ sb: String = "Main")->UIViewController? {
        let storyboard = UIStoryboard(name: sb, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: id)
        return vc
    }
}
