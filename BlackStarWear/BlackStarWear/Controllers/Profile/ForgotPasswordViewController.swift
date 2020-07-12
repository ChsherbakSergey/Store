//
//  ForgotPasswordViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 6/24/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var cancelButtonOutlet: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCancelButton()
    }
    
    func setCancelButton() {
        cancelButtonOutlet.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 15)!], for: UIControl.State.normal)
    }
    
    @IBAction func CancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
