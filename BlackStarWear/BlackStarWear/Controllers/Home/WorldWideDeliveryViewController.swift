//
//  WorldWideDeliveryViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/17/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class WorldWideDeliveryViewController: UIViewController {

    @IBOutlet weak var backButtonOutlet: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        backButtonOutlet.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 15)!], for: UIControl.State.normal)
        backButtonOutlet.tintColor = UIColor.black
    }
 
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

