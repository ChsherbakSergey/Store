//
//  Alert.swift
//  BlackStarWear
//
//  Created by Sergey on 7/24/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    
    private static func showAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
    
    static func showIncorrectFormatJSONAlert(on vc: UIViewController) {
        showAlert(on: vc, with: "okay", message: "no")
    }
    
}
